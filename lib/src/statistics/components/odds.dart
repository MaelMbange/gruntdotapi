library;

class Odds {
  num winning;
  num losing;

  Odds({
    required this.winning,
    required this.losing,
  });

  factory Odds.fromJson(Map<String, dynamic> json) => Odds(
        winning: json['winning'],
        losing: json['losing'],
      );

  Map<String, dynamic> toJson() => {
        'winning': winning,
        'losing': losing,
      };

  @override
  String toString() => 'winning: $winning, losing: $losing';
}
