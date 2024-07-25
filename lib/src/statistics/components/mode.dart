library;

import 'package:gruntdotapi/gruntdotapi.dart';

import 'time_duration.dart';

enum SGameVariant {
  none,
  campaign,
  forge,
  academy,
  academyTutorial,
  academyPractice,
  slayer,
  attrition,
  elimination,
  fiesta,
  swat,
  strongholds,
  koth,
  koth2,
  totalcontrol,
  ctf,
  assault,
  extraction,
  oddball,
  stockpile,
  juggernaut,
  regicide,
  infection,
  vip,
  escalation,
  grifball,
  race,
  prototype,
  test,
  academyTest,
  audioTest,
  campaignTest,
  engineTest,
  forgeTest,
  graphicsTest,
  multiplayerTest,
  sandboxTest,
  academyTraining,
  academyWeaponDrill,
  landGrab,
  tatanka,
  minigame,
  firefight,
}

class DefaultMode {
  Map<String, dynamic> content;

  int? assists;
  int? deaths;
  num? kda;
  int? kills;

  DefaultMode({required this.content})
      : assists = content['assists'],
        deaths = content['deaths'],
        kda = content['kda'],
        kills = content['kills'];

  factory DefaultMode.fromJson(Map<String, dynamic> json) {
    if (json['flag_captures'] != null) {
      return CTF.fromJson(json);
    }
    if (json['extraction_conversions_completed'] != null) {
      return Extraction.fromJson(json);
    }
    if (json['skull_grabs'] != null) {
      return Oddball.fromJson(json);
    }
    if (json['zone_captures'] != null) {
      return Zone.fromJson(json);
    }
    if (json['stronghold_captures'] != null) {
      return Stronghold.fromJson(json);
    }
    return DefaultMode(content: json);
  }

  Map<String, dynamic> toJson() => content;
}

class CTF extends DefaultMode {
  int flagCaptureAssists;
  int flagCaptures;
  int flagCarriersKilled;
  int flagGrabs;
  int flagReturnersKilled;
  int flagReturns;
  int flagSecures;
  int flagSteals;
  int killsAsFlagCarrier;
  int killsAsFlagReturner;
  TimeDuration timeAsFlagCarrier;

  CTF({required super.content})
      : flagCaptureAssists = content['flag_capture_assists'],
        flagCaptures = content['flag_captures'],
        flagCarriersKilled = content['flag_carriers_killed'],
        flagGrabs = content['flag_grabs'],
        flagReturnersKilled = content['flag_returners_killed'],
        flagReturns = content['flag_returns'],
        flagSecures = content['flag_secures'],
        flagSteals = content['flag_steals'],
        killsAsFlagCarrier = content['kills_as_flag_carrier'],
        killsAsFlagReturner = content['kills_as_flag_returner'],
        timeAsFlagCarrier =
            TimeDuration.fromJson(content['time_as_flag_carrier']);

  factory CTF.fromJson(Map<String, dynamic> json) => CTF(
        content: json,
      );
}

class Extraction extends DefaultMode {
  int extractionConversionsCompleted;
  int extractionConversionsDenied;
  int extractionInitiationsCompleted;
  int extractionInitiationsDenied;
  int successfulExtractions;

  Extraction({required super.content})
      : extractionConversionsCompleted =
            content['extraction_conversions_completed'],
        extractionConversionsDenied = content['extraction_conversions_denied'],
        extractionInitiationsCompleted =
            content['extraction_initiations_completed'],
        extractionInitiationsDenied = content['extraction_initiations_denied'],
        successfulExtractions = content['successful_extractions'];

  factory Extraction.fromJson(Map<String, dynamic> json) => Extraction(
        content: json,
      );
}

class Oddball extends DefaultMode {
  int killsAsSkullCarrier;
  TimeDuration longestTimeAsSkullCarrier;
  int skullCarriersKilled;
  int skullGrabs;
  int skullScoringTicks;
  TimeDuration timeAsSkullCarrier;

  Oddball({required super.content})
      : killsAsSkullCarrier = content['kills_as_skull_carrier'],
        longestTimeAsSkullCarrier =
            TimeDuration.fromJson(content['longest_time_as_skull_carrier']),
        skullCarriersKilled = content['skull_carriers_killed'],
        skullGrabs = content['skull_grabs'],
        skullScoringTicks = content['skull_scoring_ticks'],
        timeAsSkullCarrier =
            TimeDuration.fromJson(content['time_as_skull_carrier']);

  factory Oddball.fromJson(Map<String, dynamic> json) => Oddball(
        content: json,
      );
}

class Zone extends DefaultMode {
  TimeDuration totalZoneOccupationTime;
  int zoneCaptures;
  int zoneDefensiveKills;
  int zoneOffensiveKills;
  int zoneScoringTicks;
  int zoneSecures;

  Zone({required super.content})
      : totalZoneOccupationTime =
            TimeDuration.fromJson(content['total_zone_occupation_time']),
        zoneCaptures = content['zone_captures'],
        zoneDefensiveKills = content['zone_defensive_kills'],
        zoneOffensiveKills = content['zone_offensive_kills'],
        zoneScoringTicks = content['zone_scoring_ticks'],
        zoneSecures = content['zone_secures'];

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        content: json,
      );
}

class ModePvP extends DefaultMode {
  ModePvP({required super.content});

  factory ModePvP.fromJson(Map<String, dynamic> json) => ModePvP(
        content: json,
      );
}

class Stronghold extends DefaultMode {
  int strongholdCaptures;
  int strongholdDefensiveKills;
  TimeDuration strongholdOccupationTime;
  int strongholdOffensiveKills;
  int strongholdScoringTicks;
  int strongholdSecures;

  Stronghold({required super.content})
      : strongholdCaptures = content['stronghold_captures'],
        strongholdDefensiveKills = content['stronghold_defensive_kills'],
        strongholdOccupationTime =
            TimeDuration.fromJson(content['stronghold_occupation_time']),
        strongholdOffensiveKills = content['stronghold_offensive_kills'],
        strongholdScoringTicks = content['stronghold_scoring_ticks'],
        strongholdSecures = content['stronghold_secures'];

  factory Stronghold.fromJson(Map<String, dynamic> json) => Stronghold(
        content: json,
      );
}

class Modes {
  CTF captureTheFlag;
  Extraction extraction;
  Oddball oddball;
  Zone zones;
  ModePvP pvp;

  Modes({
    required this.captureTheFlag,
    required this.extraction,
    required this.oddball,
    required this.zones,
    required this.pvp,
  });

  factory Modes.fromJson(Map<String, dynamic> json) => Modes(
        captureTheFlag: CTF.fromJson(json['capture_the_flag']),
        extraction: Extraction.fromJson(json['extraction']),
        oddball: Oddball.fromJson(json['oddball']),
        zones: Zone.fromJson(json['zones']),
        pvp: ModePvP.fromJson(json['pvp']),
      );

  Map<String, dynamic> toJson() => {
        'capture_the_flag': captureTheFlag.toJson(),
        'extraction': extraction.toJson(),
        'oddball': oddball.toJson(),
        'zones': zones.toJson(),
        'pvp': pvp.toJson(),
      };

  @override
  String toString() =>
      'capture_the_flag: $captureTheFlag, extraction: $extraction, oddball: $oddball, zones: $zones, pvp: $pvp';
}
