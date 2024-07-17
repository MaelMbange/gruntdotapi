/// Description of the class [Category]
///
/// Is the representation of a gamemode <category> available in the game
library;

class Category {
  final int id;
  final String name;
  final String? thumbnail;

  Category({
    required this.id,
    required this.name,
    this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      thumbnail: json['image_urls']['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_urls': {
        'thumbnail': thumbnail,
      },
    };
  }

  @override
  String toString() => 'id: $id, name: $name, thumbnail: $thumbnail';
}
