library;

class Damage {
  int taken;
  int dealt;

  Damage({
    required this.taken,
    required this.dealt,
  });

  factory Damage.fromJson(Map<String, dynamic> json) => Damage(
        taken: json['taken'],
        dealt: json['dealt'],
      );

  Map<String, dynamic> toJson() => {
        'taken': taken,
        'dealt': dealt,
      };

  @override
  String toString() => 'taken: $taken, dealt: $dealt';
}
