library;

class SProperties {
  String type;
  STeamInfo? team;

  SProperties({
    required this.type,
    required this.team,
  });

  factory SProperties.fromJson(Map<String, dynamic> json) => SProperties(
        type: json['type'],
        team: json['team'] != null ? STeamInfo.fromJson(json['team']) : null,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'team': team?.toJson(),
      };

  @override
  String toString() => 'type: $type, team: $team';
}

class STeamInfo {
  int id;
  String name;

  STeamInfo({
    required this.id,
    required this.name,
  });

  factory STeamInfo.fromJson(Map<String, dynamic> json) => STeamInfo(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  String toString() => 'id: $id, name: $name';
}
