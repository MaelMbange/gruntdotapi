library;

import 'breakdown.dart';
import 'damage.dart';
import 'rounds.dart';
import 'scores.dart';
import 'shots.dart';
import 'summary.dart';
import 'time_duration.dart';

class Core {
  Summary? summary;
  Damage? damage;
  Shots? shots;
  Rounds? rounds;
  Breakdown? breakdown;
  num? kdr;
  num? kda;
  TimeDuration? averageLifeDuration;
  Scores? scores;

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
        summary:
            json['summary'] != null ? Summary.fromJson(json['summary']) : null,
        damage: json['damage'] != null ? Damage.fromJson(json['damage']) : null,
        shots: json['shots'] != null ? Shots.fromJson(json['shots']) : null,
        rounds: json['rounds'] != null ? Rounds.fromJson(json['rounds']) : null,
        breakdown: json['breakdown'] != null
            ? Breakdown.fromJson(json['breakdown'])
            : null,
        kdr: json['kdr'] as num,
        kda: json['kda'] as num,
        averageLifeDuration: json['average_life_duration'] != null
            ? TimeDuration.fromJson(json['average_life_duration'])
            : null,
        scores: json['scores'] != null ? Scores.fromJson(json['scores']) : null,
      );

  Map<String, dynamic> toJson() => {
        'summary': summary?.toJson(),
        'damage': damage?.toJson(),
        'shots': shots?.toJson(),
        'rounds': rounds?.toJson(),
        'breakdown': breakdown?.toJson(),
        'kdr': kdr,
        'kda': kda,
        'average_life_duration': averageLifeDuration?.toJson(),
        'scores': scores?.toJson(),
      };

  @override
  String toString() =>
      'summary: $summary, damage: $damage, shots: $shots, rounds: $rounds, breakdown: $breakdown, kdr: $kdr, kda: $kda, average_life_duration: $averageLifeDuration, scores: $scores';
}
