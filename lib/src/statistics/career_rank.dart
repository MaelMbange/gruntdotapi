import 'package:gruntdotapi/gruntdotapi.dart';

class CareerRank {
  Level? level;
  MCareerRank? current;
  MCareerRank? next;

  CareerRank({
    required this.level,
    required this.current,
    this.next,
  });

  factory CareerRank.fromJson(Map<String, dynamic> json) {
    return CareerRank(
      level: json['level'] != null ? Level.fromJson(json['level']) : null,
      current: json['current'] != null
          ? MCareerRank.fromJson(json['current'])
          : null,
      next: json['next'] != null ? MCareerRank.fromJson(json['next']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level?.toJson(),
      'current': current?.toJson(),
      'next': next?.toJson(),
    };
  }

  @override
  String toString() => 'level: $level, current: $current, next: $next';
}

class Level {
  int? totalXP;
  int? remainingXpToNextLevel;
  int? nextLevelThreshold;

  Level({
    required this.totalXP,
    required this.remainingXpToNextLevel,
    required this.nextLevelThreshold,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      totalXP: json['total_xp'],
      remainingXpToNextLevel: json['remaining_xp_to_next_level'],
      nextLevelThreshold: json['next_level_threshold'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_xp': totalXP,
      'remaining_xp_to_next_level': remainingXpToNextLevel,
      'next_level_threshold': nextLevelThreshold,
    };
  }

  @override
  String toString() =>
      'totalXP: $totalXP, remainingXpToNextLevel: $remainingXpToNextLevel, nextLevelThreshold: $nextLevelThreshold';
}
