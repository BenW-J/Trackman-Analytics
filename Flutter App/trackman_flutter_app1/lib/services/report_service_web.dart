import 'dart:convert';
import 'dart:html'; // Import for web platforms
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:trackman_flutter_app1/model/all_combine_models.dart';

class ReportService {
  Future<void> fetchAndProcessData(String url) async {
    try {
      // Make the initial GET request to fetch the data
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Example: Extract the ReportId from the received data
        final reportId = extractReportId(data);

        // Fetch the detailed report using the extracted ReportId
        await fetchReport(reportId);

      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching and processing data: $e');
    }
  }

  // Method to fetch the report data using the provided ReportId
  Future<void> fetchReport(String reportId) async {
    // Define the API endpoint URL
    final apiUrl = Uri.parse("https://tm-player-activities.azurewebsites.net/api/reports/getreport");

    // Define the headers for the request
    final headers = {
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br, zstd",
      "Accept-Language": "en-US,en;q=0.9",
      "Connection": "keep-alive",
      "Content-Type": "application/json",
      "Origin": "https://web-dynamic-reports.azurewebsites.net",
      "Referer": "https://web-dynamic-reports.azurewebsites.net/",
      "Sec-CH-UA": '"Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"',
      "Sec-CH-UA-Mobile": "?0",
      "Sec-CH-UA-Platform": '"Windows"',
      "Sec-Fetch-Dest": "empty",
      "Sec-Fetch-Mode": "cors",
      "Sec-Fetch-Site": "cross-site",
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
    };

    // Define the payload data for the POST request
    final payload = jsonEncode({
      "ReportId": reportId // Replace with the actual Report ID
    });

    try {
      // Make the POST request
      final response = await http.post(apiUrl, headers: headers, body: payload);

      // Check if the request was successful
      if (response.statusCode == 200) {
        final reportData = jsonDecode(response.body);
        print("Report fetched successfully!");

        // Process the report data
        processReportData(reportData);
      } else {
        print("Failed to fetch report: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error fetching report: $e");
    }
  }

  // Extract ReportId from initial data if needed
  String extractReportId(dynamic data) {
    // Extract the ReportId from your JSON structure
    // This is a placeholder; adjust according to your actual data structure
    return data['ReportId'];
  }

  // Process the report data
  void processReportData(dynamic data) async {
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

    // Use browser's download functionality
    final bytes = utf8.encode(csv);
    final blob = Blob([bytes]);
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    Url.revokeObjectUrl(url);
    print('Saved $filename using browser download.');
  }
}
