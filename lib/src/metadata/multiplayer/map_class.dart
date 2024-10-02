/// Description of the class [MMapClass]
///
/// Is the representation of a map available in the game
library;

class MMapClass {
  final String? id;
  final String? name;
  final String? thumbnail;

  MMapClass({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory MMapClass.fromJson(Map<String, dynamic> json) {
    return MMapClass(
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
