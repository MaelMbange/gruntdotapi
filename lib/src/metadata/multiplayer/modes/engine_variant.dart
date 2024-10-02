/// Description of the class [EngineVariant]
///
/// Is the representation of a gamemode variant available in the game
library;

class Enginevariant {
  final String? id;
  final String? name;
  final String? hash;
  final String? icon;

  Enginevariant({
    required this.id,
    required this.name,
    required this.hash,
    required this.icon,
  });

  factory Enginevariant.fromJson(Map<String, dynamic> json) => Enginevariant(
        id: json['id'],
        name: json['name'],
        hash: json['hash'],
        icon: json['image_urls']['icon'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hash': hash,
        'image_urls': {
          'icon': icon,
        },
      };

  @override
  String toString() => 'id: $id, name: $name, hash: $hash, icon: $icon';
}
