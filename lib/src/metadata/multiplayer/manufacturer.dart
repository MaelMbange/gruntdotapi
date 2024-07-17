/// Description of the class [Manufacturer]
///
/// Is the representation of a Manufacturer available in the game
library;

class Manufacturer {
  /// ID of the manufacturer
  final int id;

  /// Name of the manufacturer
  final String name;

  /// URL to the logo of the manufacturer
  final String logo;

  Manufacturer({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      id: json['id'],
      name: json['name'],
      logo: json['image_urls']['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_urls': {
        'logo': logo,
      },
    };
  }

  @override
  String toString() => 'id: $id, name: $name, logo: $logo';
}
