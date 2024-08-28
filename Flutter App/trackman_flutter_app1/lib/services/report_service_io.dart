import 'dart:convert';
import 'dart:io'; // Import for mobile/desktop platforms
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:trackman_flutter_app1/model/all_combine_models.dart';
import 'package:flutter/foundation.dart';

class ReportService {
  Future<void> fetchAndProcessData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final players = <Player>[];
        final combineTestReports = <CombineTestReport>[];
        final strokes = <Stroke>[];
        final measurements = <Measurement>[];

        final playerIds = <String>{};

        for (var strokeGroup in data['StrokeGroups']) {
          final playerJson = strokeGroup['Player'];
          final playerId = playerJson['Id'];

          if (!playerIds.contains(playerId)) {
            final player = Player.fromJson(playerJson);
            players.add(player);
            playerIds.add(playerId);
          }

          final report = CombineTestReport.fromJson(strokeGroup, playerId);
          combineTestReports.add(report);

          for (var strokeJson in strokeGroup['Strokes']) {
            final stroke = Stroke.fromJson(strokeJson, report.id);
            strokes.add(stroke);
            measurements.add(stroke.measurement);
          }
        }

        await _saveModelsToCsv('players.csv', players);
        await _saveModelsToCsv('combine_test_reports.csv', combineTestReports);
        await _saveModelsToCsv('strokes.csv', strokes);
        await _saveModelsToCsv('measurements.csv', measurements);

        print('Data successfully saved to CSV files.');
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching and processing data: $e');
    }
  }

  Future<void> _saveModelsToCsv<T>(String filename, List<T> models) async {
    if (models.isEmpty) return;

    List<List<dynamic>> csvData = [];

    if (models.first is Player) {
      csvData.add(Player.csvHeaders());
      csvData.addAll(models.map((e) => (e as Player).toCsvRow()));
    } else if (models.first is CombineTestReport) {
      csvData.add(CombineTestReport.csvHeaders());
      csvData.addAll(models.map((e) => (e as CombineTestReport).toCsvRow()));
    } else if (models.first is Stroke) {
      csvData.add(Stroke.csvHeaders());
      csvData.addAll(models.map((e) => (e as Stroke).toCsvRow()));
    } else if (models.first is Measurement) {
      csvData.add(Measurement.csvHeaders());
      csvData.addAll(models.map((e) => (e as Measurement).toCsvRow()));
    } else {
      throw Exception('Unsupported model type');
    }

    String csv = const ListToCsvConverter().convert(csvData);

    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/$filename';
      final file = File(path);

      await file.writeAsString(csv);
      print('Saved $filename to $path');
    } catch (e) {
      print('Error saving CSV file: $e');
    }
  }
}