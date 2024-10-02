library;

class Currency {
  final String? id;
  final String? title;
  final String? image;

  Currency({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      title: json['title'],
      image: json['image_urls']['asset'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_urls': {
        'asset': image,
      },
    };
  }

  @override
  String toString() => 'id: $id, title: $title, image: $image';
}
