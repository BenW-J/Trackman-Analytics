class Player {
  final String id;
  final String name;
  final String email;
  final double hcp;
  final String gender;
  final String nationality;
  final String birthday;
  final String? mailchimp;

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
      hcp: (json['Hcp'] as num).toDouble(),
      gender: json['Gender'],
      nationality: json['Nationality'],
      birthday: json['Birthday'],
      mailchimp: json['Properties']?['MailChimp'],
    );
  }

  List<String> toCsvRow() {
    return [
      id,
      name,
      email,
      hcp.toString(),
      gender,
      nationality,
      birthday,
      mailchimp ?? '',
    ];
  }

  static List<String> csvHeaders() {
    return [
      'id',
      'name',
      'email',
      'hcp',
      'gender',
      'nationality',
      'birthday',
      'mailchimp',
    ];
  }
}