part of 'store.dart';

class StoreOffering {
  final String? name;
  final String? description;
  final String? imageUrl;
  final List<StoreOfferingItem> items;

  StoreOffering({
    this.name,
    this.description,
    this.imageUrl,
    required this.items,
  });

  factory StoreOffering.fromJson(Map<String, dynamic> json) => StoreOffering(
        name: json['name'],
        description: json['description'],
        imageUrl: json['image_urls']['offering'],
        items: List<StoreOfferingItem>.from(
            json['items'].map((item) => StoreOfferingItem.fromJson(item))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image_urls': {
          'offering': imageUrl,
        },
        'items': items.map((item) => item.toJson()).toList(),
      };

  @override
  String toString() =>
      "name: $name, description: $description, image_url: $imageUrl, items: $items";
}
