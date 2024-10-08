part of 'match.dart';

class MatchMadeBreakdown {
  int? wins;
  int? losses;
  int? ties;
  int? completed;

  MatchMadeBreakdown({
    required this.wins,
    required this.losses,
    required this.ties,
    required this.completed,
  });

  factory MatchMadeBreakdown.fromJson(Map<String, dynamic> json) =>
      MatchMadeBreakdown(
        wins: json['wins'],
        losses: json['losses'],
        ties: json['ties'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'wins': wins,
        'losses': losses,
        'ties': ties,
        'completed': completed,
      };

  @override
  String toString() =>
      'wins: $wins, losses: $losses, ties: $ties, completed: $completed';
}

class MatchMade {
  StatsMatchMade? stats;
  MatchMadeBreakdown? matches;
  TimeDuration? timePlayed;

  MatchMade({
    required this.stats,
    required this.matches,
    required this.timePlayed,
  });

  factory MatchMade.fromJson(Map<String, dynamic> json) => MatchMade(
        stats: json['stats'] != null
            ? StatsMatchMade.fromJson(json['stats'])
            : null,
        matches: json['matches'] != null
            ? MatchMadeBreakdown.fromJson(json['matches'])
            : null,
        timePlayed: json['time_played'] != null
            ? TimeDuration.fromJson(json['time_played'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'stats': stats?.toJson(),
        'matches': matches?.toJson(),
        'time_played': timePlayed?.toJson(),
      };

  @override
  String toString() =>
      'stats: $stats, matches: $matches, time_played: $timePlayed';
}
