part of 'store.dart';

class StoreOfferingItem {
  final String? imageUrl;

  StoreOfferingItem({required this.imageUrl});

  factory StoreOfferingItem.fromJson(Map<String, dynamic> json) =>
      StoreOfferingItem(
        imageUrl: json['image_urls']['item'],
      );

  Map<String, dynamic> toJson() => {
        'items': {
          'image_urls': {
            'item': imageUrl,
          },
        },
      };

  @override
  String toString() => "image_url: $imageUrl";
}
