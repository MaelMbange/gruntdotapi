/// Description of the class [MTeam]
///
/// Is the representation of a team available in the game
library;

class MTeam {
  /// id of the team.
  final int? id;

  /// name of the team.
  final String? name;

  /// url of the icon of the team.
  final String? icon;

  final String? color;

  MTeam({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory MTeam.fromJson(Map<String, dynamic> json) => MTeam(
        id: json['id'],
        name: json['name'],
        icon: json['image_urls']['icon'],
        color: json['properties']['color']['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_urls': {
          'icon': icon,
        },
        'properties': {
          'color': {
            'value': color,
          },
        },
      };

  @override
  String toString() => 'id: $id, name: $name, icon: $icon, color: $color,';
}
