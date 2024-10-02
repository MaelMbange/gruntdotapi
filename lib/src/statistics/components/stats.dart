library;

import 'core.dart';
import 'mode.dart';

class Stats {
  Core? core;
  DefaultMode? mode;
  num? mmr;

  Stats({
    required this.core,
    required this.mode,
    required this.mmr,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        core: json['core'] != null ? Core.fromJson(json['core']) : null,
        mode: json['mode'] != null ? DefaultMode.fromJson(json['mode']) : null,
        mmr: json['mmr'],
      );

  Map<String, dynamic> toJson() => {
        'core': core?.toJson(),
        'mode': mode?.toJson(),
        'mmr': mmr?.toString(),
      };

  @override
  String toString() => 'core: $core, mode: $mode, mmr: $mmr';
}

class StatsMatchMade {
  Core? core;
  Modes? modes;

  StatsMatchMade({
    required this.core,
    required this.modes,
  });

  factory StatsMatchMade.fromJson(Map<String, dynamic> json) => StatsMatchMade(
        core: json['core'] != null ? Core.fromJson(json['core']) : null,
        modes: json['modes'] != null ? Modes.fromJson(json['modes']) : null,
      );

  Map<String, dynamic> toJson() => {
        'core': core?.toJson(),
        'modes': modes?.toJson(),
      };

  @override
  String toString() => 'core: $core, modes: $modes';
}
