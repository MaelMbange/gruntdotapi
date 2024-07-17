library;

class Performances {
  PerformanceStats kills;
  PerformanceStats deaths;

  Performances({
    required this.kills,
    required this.deaths,
  });

  factory Performances.fromJson(Map<String, dynamic> json) => Performances(
        kills: PerformanceStats.fromJson(json['kills']),
        deaths: PerformanceStats.fromJson(json['deaths']),
      );

  Map<String, dynamic> toJson() => {
        'kills': kills.toJson(),
        'deaths': deaths.toJson(),
      };
}

class PerformanceStats {
  int count;
  num expected;
  num standardDeviation;

  PerformanceStats({
    required this.count,
    required this.expected,
    required this.standardDeviation,
  });

  factory PerformanceStats.fromJson(Map<String, dynamic> json) =>
      PerformanceStats(
        count: json['count'],
        expected: json['expected'] as num,
        standardDeviation: json['standard_deviation'] as num,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'expected': expected,
        'standard_deviation': standardDeviation,
      };

  @override
  String toString() =>
      'count: $count, expected: $expected, standard_deviation: $standardDeviation';
}
