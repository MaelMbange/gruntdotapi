/// Description of the class [MMedal]
///
/// Is the representation of a medal available in the game
library;

class MMedal {
  /// id of the medal.
  final int? id;

  /// name of the medal.
  final String? name;

  /// description of the medal.
  final String? description;

  /// url of the small image of the medal.
  final String? small;

  /// url of the medium image of the medal.
  final String? medium;

  /// url of the large image of the medal.
  final String? large;

  /// difficulty of the medal, can be used to set the color of the medal background.
  final String? difficulty;

  /// type of the medal.
  final String? type;

  MMedal({
    required this.id,
    required this.name,
    required this.description,
    required this.small,
    required this.medium,
    required this.large,
    required this.difficulty,
    required this.type,
  });

  factory MMedal.fromJson(Map<String, dynamic> json) => MMedal(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        small: json['image_urls']['small'],
        medium: json['image_urls']['medium'],
        large: json['image_urls']['large'],
        difficulty: json['attributes']['difficulty'],
        type: json['properties']['type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_urls': {
          'small': small,
          'medium': medium,
          'large': large,
        },
        'attributes': {
          'difficulty': difficulty,
        },
        'properties': {
          'type': type,
        },
      };

  @override
  String toString() {
    return 'id: $id, name: $name, description: $description, difficulty: $difficulty, type: $type';
  }
}
