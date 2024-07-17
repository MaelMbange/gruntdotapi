/// Description of the class [WeaklyReward]
///
/// Is the representation of the current weakly reward available in the game
library;

class WeaklyReward {
  /// Title of the weakly reward
  final String title;

  /// Description of the weakly reward/objectif to reach to validate the weakly reward
  final String description;

  /// Difficulty of the weakly reward
  final String difficulty;

  /// Threshold for success of the weakly reward (amount needed to validate the weakly reward)
  final int thresholdForSuccess;

  /// List of items that can be won by completing the weakly reward
  final List<WeaklyRewardItem> items;

  WeaklyReward({
    required this.title,
    required this.description,
    required this.difficulty,
    required this.thresholdForSuccess,
    required this.items,
  });

  factory WeaklyReward.fromJson(Map<String, dynamic> json) {
    return WeaklyReward(
      title: json['title'],
      description: json['description'],
      difficulty: json['attributes']['difficulty'],
      thresholdForSuccess: json['properties']['threshold_for_success'],
      items: List<WeaklyRewardItem>.from(
          json['items'].map((item) => WeaklyRewardItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'attributes': {
        'difficulty': difficulty,
      },
      'properties': {
        'threshold_for_success': thresholdForSuccess,
      },
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'title: $title, description: $description, difficulty: $difficulty, threshold_for_success: $thresholdForSuccess, items: $items';
}

class WeaklyRewardItem {
  /// ID of the item
  final int id;

  /// Title of the item
  final String title;

  /// Description of the item
  final String description;

  /// URL to the image of the item
  final String imageUrls;

  WeaklyRewardItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
  });

  factory WeaklyRewardItem.fromJson(Map<String, dynamic> json) {
    return WeaklyRewardItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrls: json['image_urls']['item'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_urls': {
        'item': imageUrls,
      },
    };
  }

  @override
  String toString() =>
      'id: $id, title: $title, description: $description, image_url: $imageUrls';
}
