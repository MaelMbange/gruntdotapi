library;

class Scores {
  int personal;
  int points;

  Scores({
    required this.personal,
    required this.points,
  });

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        personal: json['personal'],
        points: json['points'],
      );

  Map<String, dynamic> toJson() => {
        'personal': personal,
        'points': points,
      };

  @override
  String toString() => 'personal: $personal, points: $points';
}
