library;

class Shots {
  int? fired;
  int? hit;
  int? missed;
  num? accuracy;

  Shots({
    required this.fired,
    required this.hit,
    required this.missed,
    required this.accuracy,
  });

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        fired: json['fired'],
        hit: json['hit'],
        missed: json['missed'],
        accuracy: json['accuracy'] as num,
      );

  Map<String, dynamic> toJson() => {
        'fired': fired,
        'hit': hit,
        'missed': missed,
        'accuracy': accuracy,
      };

  @override
  String toString() =>
      'fired: $fired, hit: $hit, missed: $missed, accuracy: $accuracy';
}
