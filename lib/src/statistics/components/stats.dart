library;

import 'core.dart';
import 'mode.dart';

class Stats {
  Core core;
  DefaultMode mode;
  num? mmr;

  Stats({
    required this.core,
    required this.mode,
    required this.mmr,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        core: Core.fromJson(json['core']),
        mode: DefaultMode.fromJson(json['mode']),
        mmr: json['mmr'],
      );

  Map<String, dynamic> toJson() => {
        'core': core.toJson(),
        'mode': mode.toJson(),
        'mmr': mmr,
      };

  @override
  String toString() => 'core: $core, mode: $mode, mmr: $mmr';
}
