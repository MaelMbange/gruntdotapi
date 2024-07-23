library;

import 'breakdown.dart';
import 'damage.dart';
import 'rounds.dart';
import 'scores.dart';
import 'shots.dart';
import 'summary.dart';
import 'time_duration.dart';

class Core {
  Summary summary;
  Damage damage;
  Shots shots;
  Rounds rounds;
  Breakdown breakdown;
  num kdr;
  num kda;
  TimeDuration? averageLifeDuration;
  Scores scores;

  Core({
    required this.summary,
    required this.damage,
    required this.shots,
    required this.rounds,
    required this.breakdown,
    required this.kdr,
    required this.kda,
    this.averageLifeDuration,
    required this.scores,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        summary: Summary.fromJson(json['summary']),
        damage: Damage.fromJson(json['damage']),
        shots: Shots.fromJson(json['shots']),
        rounds: Rounds.fromJson(json['rounds']),
        breakdown: Breakdown.fromJson(json['breakdown']),
        kdr: json['kdr'] as num,
        kda: json['kda'] as num,
        averageLifeDuration: json['average_life_duration'] != null
            ? TimeDuration.fromJson(json['average_life_duration'])
            : null,
        scores: Scores.fromJson(json['scores']),
      );

  Map<String, dynamic> toJson() => {
        'summary': summary.toJson(),
        'damage': damage.toJson(),
        'shots': shots.toJson(),
        'rounds': rounds.toJson(),
        'breakdown': breakdown.toJson(),
        'kdr': kdr,
        'kda': kda,
        'average_life_duration': averageLifeDuration?.toJson(),
        'scores': scores.toJson(),
      };

  @override
  String toString() =>
      'summary: $summary, damage: $damage, shots: $shots, rounds: $rounds, breakdown: $breakdown, kdr: $kdr, kda: $kda, average_life_duration: $averageLifeDuration, scores: $scores';
}
