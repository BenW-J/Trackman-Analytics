class CombineTestReport {
  final String id;
  final String date;
  final String target;
  final double? avgScore;
  final double? avgDistanceFromPin;
  final String playerId;

  CombineTestReport({
    required this.id,
    required this.date,
    required this.target,
    this.avgScore,
    this.avgDistanceFromPin,
    required this.playerId,
  });

  factory CombineTestReport.fromJson(Map<String, dynamic> json, String playerId) {
    return CombineTestReport(
      id: json['Id'],
      date: json['Date'],
      target: json['Target'],
      avgScore: (json['AvgScore'] as num?)?.toDouble(),
      avgDistanceFromPin: (json['AvgDistanceFromPin'] as num?)?.toDouble(),
      playerId: playerId,
    );
  }

  List<String> toCsvRow() {
    return [
      id,
      date,
      target,
      avgScore?.toString() ?? '',
      avgDistanceFromPin?.toString() ?? '',
      playerId,
    ];
  }

  static List<String> csvHeaders() {
    return [
      'id',
      'date',
      'target',
      'avg_score',
      'avg_distance_from_pin',
      'player_id',
    ];
  }
}