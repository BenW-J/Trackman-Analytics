import 'package:trackman_flutter_app1/model/measurement_model.dart';

class Stroke {
  final String id;
  final String time;
  final String club;
  final String ball;
  final String combineTestReportId;
  final double? score;
  final double? distanceFromPin;
  final Measurement measurement;

  Stroke({
    required this.id,
    required this.time,
    required this.club,
    required this.ball,
    required this.combineTestReportId,
    this.score,
    this.distanceFromPin,
    required this.measurement,
  });

  factory Stroke.fromJson(Map<String, dynamic> json, String combineTestReportId) {
    return Stroke(
      id: json['Id'],
      time: json['Time'],
      club: json['Club'],
      ball: json['Ball'],
      combineTestReportId: combineTestReportId,
      score: (json['Measurement']['Score'] as num?)?.toDouble(),
      distanceFromPin: (json['Measurement']['DistanceFromPin'] as num?)?.toDouble(),
      measurement: Measurement.fromJson(json['Measurement'], json['Id']),
    );
  }

  List<String> toCsvRow() {
    return [
      id,
      time,
      club,
      ball,
      combineTestReportId,
      score?.toString() ?? '',
      distanceFromPin?.toString() ?? '',
      measurement.id,
    ];
  }

  static List<String> csvHeaders() {
    return [
      'id',
      'time',
      'club',
      'ball',
      'combine_test_report_id',
      'score',
      'distance_from_pin',
      'measurement_id',
    ];
  }
}