library;

class Rounds {
  int won;
  int lost;
  int tied;

  Rounds({
    required this.won,
    required this.lost,
    required this.tied,
  });

  factory Rounds.fromJson(Map<String, dynamic> json) => Rounds(
        won: json['won'],
        lost: json['lost'],
        tied: json['tied'],
      );

  Map<String, dynamic> toJson() => {
        'won': won,
        'lost': lost,
        'tied': tied,
      };

  @override
  String toString() => 'won: $won, lost: $lost, tied: $tied';
}
