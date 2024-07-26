library;

import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:gruntdotapi/src/network.dart' as net;

part 'match_ext_1.dart';

abstract class MatchDefaults implements Comparable<MatchDefaults> {
  final String id;
  final SDetails details;
  final MatchProperties properties;

  final MatchSeason season;
  final TimeDuration playableDuration;
  final DateTime startedAt;
  final DateTime endedAt;

  MatchDefaults({
    required this.id,
    required this.details,
    required this.properties,
    required this.season,
    required this.playableDuration,
    required this.startedAt,
    required this.endedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is MatchDefaults) return id == other.id;

    return false;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  int compareTo(MatchDefaults other) {
    if (this == other) return 0;
    return other.startedAt.compareTo(startedAt);
  }

  @override
  String toString() =>
      'id: $id, details: $details, properties: $properties, season: $season, playable_duration: $playableDuration, started_at: $startedAt, ended_at: $endedAt';
}

class MatchProperties {
  String type;
  String interaction;
  String experience;

  MatchProperties({
    required this.type,
    required this.interaction,
    required this.experience,
  });

  factory MatchProperties.fromJson(Map<String, dynamic> json) =>
      MatchProperties(
        type: json['type'],
        interaction: json['interaction'],
        experience: json['experience'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'interaction': interaction,
        'experience': experience,
      };

  @override
  String toString() =>
      'type: $type, interaction: $interaction, experience: $experience';
}

class MatchSeason {
  int id;
  int version;
  MatchSeasonProperties properties;

  MatchSeason({
    required this.id,
    required this.version,
    required this.properties,
  });

  factory MatchSeason.fromJson(Map<String, dynamic> json) => MatchSeason(
        id: json['id'],
        version: json['version'],
        properties: MatchSeasonProperties.fromJson(json['properties']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
        'properties': properties.toJson(),
      };

  @override
  String toString() => 'id: $id, version: $version, properties: $properties';
}

class MatchSeasonProperties {
  String identifier;
  String csr;

  MatchSeasonProperties({
    required this.identifier,
    required this.csr,
  });

  factory MatchSeasonProperties.fromJson(Map<String, dynamic> json) =>
      MatchSeasonProperties(
        identifier: json['identifier'],
        csr: json['csr'],
      );

  Map<String, dynamic> toJson() => {
        'identifier': identifier,
        'csr': csr,
      };

  @override
  String toString() => 'identifier: $identifier, csr: $csr';
}

class Match extends MatchDefaults {
  final Player player;

  Match({
    required super.id,
    required super.details,
    required super.properties,
    required super.season,
    required this.player,
    required super.playableDuration,
    required super.startedAt,
    required super.endedAt,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json['id'],
        details: SDetails.fromJson(json['details']),
        properties: MatchProperties.fromJson(json['properties']),
        season: MatchSeason.fromJson(json['season']),
        player: Player.fromJson(json['player']),
        playableDuration: TimeDuration.fromJson(json['playable_duration']),
        startedAt: DateTime.parse(json['started_at']),
        endedAt: DateTime.parse(json['ended_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'details': details.toJson(),
        'properties': properties.toJson(),
        'season': season.toJson(),
        'player': player.toJson(),
        'playable_duration': playableDuration.toJson(),
        'started_at': startedAt.toIso8601String(),
        'ended_at': endedAt.toIso8601String(),
      };

  Future<dynamic> getMoreStats(String token) async {
    var matchStats = await net
        .get(net.matchStatsUrl.replaceAll('{matchId}', id), token: token);
    return MatchStats.fromJson(matchStats['data']);
  }

  bool operator <(Match other) =>
      this != other && startedAt.compareTo(other.startedAt) < 0;

  bool operator >(Match other) =>
      this != other && startedAt.compareTo(other.startedAt) > 0;

  bool operator <=(Match other) =>
      this != other && startedAt.compareTo(other.startedAt) <= 0;

  bool operator >=(Match other) =>
      this != other && startedAt.compareTo(other.startedAt) >= 0;

  @override
  String toString() =>
      'id: $id, details: $details, properties: $properties, season: $season, player: $player, playable_duration: $playableDuration, started_at: $startedAt, ended_at: $endedAt';
}

class MatchStats extends MatchDefaults {
  final List<STeam> teams;
  final List<Player> players;

  MatchStats({
    required super.id,
    required super.details,
    required super.properties,
    required this.teams,
    required this.players,
    required super.season,
    required super.playableDuration,
    required super.startedAt,
    required super.endedAt,
  });

  factory MatchStats.fromJson(Map<String, dynamic> json) => MatchStats(
        id: json['id'],
        details: SDetails.fromJson(json['details']),
        properties: MatchProperties.fromJson(json['properties']),
        teams: List<STeam>.from(json['teams'].map((x) => STeam.fromJson(x))),
        players:
            List<Player>.from(json['players'].map((x) => Player.fromJson(x))),
        season: MatchSeason.fromJson(json['season']),
        playableDuration: TimeDuration.fromJson(json['playable_duration']),
        startedAt: DateTime.parse(json['started_at']),
        endedAt: DateTime.parse(json['ended_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'details': details.toJson(),
        'properties': properties.toJson(),
        'teams': teams.map((team) => team.toJson()).toList(),
        'players': players.map((player) => player.toJson()).toList(),
        'season': season.toJson(),
        'playable_duration': playableDuration.toJson(),
        'started_at': startedAt.toIso8601String(),
        'ended_at': endedAt.toIso8601String(),
      };

  bool operator <(MatchStats other) =>
      this != other && startedAt.compareTo(other.startedAt) < 0;

  bool operator >(MatchStats other) =>
      this != other && startedAt.compareTo(other.startedAt) > 0;

  bool operator <=(MatchStats other) =>
      this != other && startedAt.compareTo(other.startedAt) <= 0;

  bool operator >=(MatchStats other) =>
      this != other && startedAt.compareTo(other.startedAt) >= 0;

  @override
  String toString() =>
      'id: $id, details: $details, properties: $properties, teams: $teams, players: $players, season: $season, playable_duration: $playableDuration, started_at: $startedAt, ended_at: $endedAt';
}
