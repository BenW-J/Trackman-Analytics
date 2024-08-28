class Player {
  String id;
  String name;
  String email;
  int hcp;
  String gender;
  String nationality;
  String birthday;
  String? mailchimp;

  Player({
    required this.id,
    required this.name,
    required this.email,
    required this.hcp,
    required this.gender,
    required this.nationality,
    required this.birthday,
    this.mailchimp,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['Id'],
      name: json['Name'],
      email: json['Email'],
      hcp: json['Hcp'],
      gender: json['Gender'],
      nationality: json['Nationality'],
      birthday: json['Birthday'],
      mailchimp: json['Properties']?['MailChimp'],
    );
  }
}

class CombineTestReport {
  String id;
  String date;
  String target;
  double? avgScore;
  double? avgDistanceFromPin;
  String playerId;

  CombineTestReport({
    required this.id,
    required this.date,
    required this.target,
    this.avgScore,
    this.avgDistanceFromPin,
    required this.playerId,
  });

  factory CombineTestReport.fromJson(Map<String, dynamic> json) {
    return CombineTestReport(
      id: json['Id'],
      date: json['Date'],
      target: json['Target'],
      avgScore: json['AvgScore']?.toDouble(),
      avgDistanceFromPin: json['AvgDistanceFromPin']?.toDouble(),
      playerId: json['Player']['Id'],
    );
  }
}

// Define other models (Strokes, Measurements) similarly...
