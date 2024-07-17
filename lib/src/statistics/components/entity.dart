library;

import 'attributes.dart';
import 'odds.dart';
import 'participation.dart';
import 'performance.dart';
import 'progression.dart';
import 'properties.dart';
import 'stats.dart';

abstract class Entity {
  String? name;
  int rank;
  String outcome;
  Stats stats;

  Entity({
    required this.name,
    required this.rank,
    required this.outcome,
    required this.stats,
  });

  @override
  String toString() =>
      'name: $name, rank: $rank, outcome: $outcome, stats: $stats';
}

class Player extends Entity {
  Attributes? attributes;
  SProperties properties;
  Participation participation;
  Progression progression;
  Performances? performances;

  Player({
    required super.name,
    required super.rank,
    required super.outcome,
    required this.attributes,
    required this.properties,
    required super.stats,
    required this.participation,
    required this.progression,
    required this.performances,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json['name'],
        rank: json['rank'],
        outcome: json['outcome'],
        attributes: json['attributes'] != null
            ? Attributes.fromJson(json['attributes'])
            : null,
        properties: SProperties.fromJson(json['properties']),
        stats: Stats.fromJson(json['stats']),
        participation: Participation.fromJson(json['participation']),
        progression: Progression.fromJson(json['progression']),
        performances: json['performances'] != null
            ? Performances.fromJson(json['performances'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'rank': rank,
        'outcome': outcome,
        'attributes': attributes?.toJson(),
        'properties': properties.toJson(),
        'stats': stats.toJson(),
        'participation': participation.toJson(),
        'progression': progression.toJson(),
        'performances': performances?.toJson(),
      };

  @override
  String toString() =>
      'name: $name, rank: $rank, outcome: $outcome, attributes: $attributes, properties: $properties, stats: $stats, participation: $participation, progression: $progression, performances: $performances';
}

class STeam extends Entity {
  int id;
  Odds odds;

  STeam({
    required this.id,
    required super.name,
    required super.rank,
    required super.outcome,
    required super.stats,
    required this.odds,
  });

  factory STeam.fromJson(Map<String, dynamic> json) => STeam(
        id: json['id'],
        name: json['name'],
        rank: json['rank'],
        outcome: json['outcome'],
        stats: Stats.fromJson(json['stats']),
        odds: Odds.fromJson(json['odds']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rank': rank,
        'outcome': outcome,
        'stats': stats.toJson(),
        'odds': odds.toJson(),
      };

  @override
  String toString() =>
      'id: $id, name: $name, rank: $rank, outcome: $outcome, stats: $stats, odds: $odds';
}
