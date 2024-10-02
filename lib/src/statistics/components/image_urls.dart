library;

class ImageUrls {
  final String? hero;
  final String? thumbnail;
  final List<String>? screenshots;

  ImageUrls({
    required this.hero,
    required this.thumbnail,
    required this.screenshots,
  });

  factory ImageUrls.fromJson(Map<String, dynamic> json) => ImageUrls(
        hero: json['hero'],
        thumbnail: json['thumbnail'],
        screenshots: json['screenshots'] != null
            ? List<String>.from(json['screenshots'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'hero': hero,
        'thumbnail': thumbnail,
        'screenshots': screenshots,
      };

  @override
  String toString() =>
      'hero: $hero, thumbnail: $thumbnail, screenshots: $screenshots';
}
