/// Description of the class [MCareerRank]
///
/// Is the representation of a career rank available in the game
library;

class MCareerRank {
  /// Rank of the career
  final int rank;

  /// Title of the career rank
  final String title;

  /// Title of the career rank (generally the name of the rank: exemple: "Bronze-...-Onyx")
  final String subtitle;

  /// Icon of the career rank
  final String icon;

  /// Large icon of the career rank
  final String? largeIcon;

  /// Adornment icon of the career rank
  final String? adornmentIcon;

  /// Tier of the career rank
  final int? tier;

  /// Grade of the career rank (generally 3 grade per rank)
  final int grade;

  /// Colors of the career rank (maincolor and secondary color)
  final List<String> colors;

  /// Type of the career rank - is the name of the rank level (Bronze-...-Onyx)
  final String type;

  /// Quantity of experience points needed to reach this rank
  final int threshold;

  MCareerRank({
    required this.rank,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.largeIcon,
    this.adornmentIcon,
    this.tier,
    required this.grade,
    required this.colors,
    required this.type,
    required this.threshold,
  });

  factory MCareerRank.fromJson(Map<String, dynamic> json) {
    return MCareerRank(
      rank: json['rank'],
      title: json['title'],
      subtitle: json['subtitle'],
      icon: json['image_urls']['icon'],
      largeIcon: json['image_urls']['large_icon'],
      adornmentIcon: json['image_urls']['adornment_icon'],
      tier: json['attributes']['tier'],
      grade: json['attributes']['grade'],
      colors:
          List<String>.from(json['attributes']['colors'].map((color) => color)),
      type: json['properties']['type'],
      threshold: json['properties']['threshold'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'subtitle': subtitle,
      'image_urls': {
        'icon': icon,
        'large_icon': largeIcon,
        'adornment_icon': adornmentIcon,
      },
      'attributes': {
        'tier': tier,
        'grade': grade,
        'colors': colors,
      },
      'properties': {
        'type': type,
        'threshold': threshold,
      },
    };
  }

  @override
  String toString() =>
      'rank: $rank, title: $title, subtitle: $subtitle, icon: $icon, large_icon: $largeIcon, adornment_icon: $adornmentIcon, tier: $tier, grade: $grade, colors: $colors, type: $type, threshold: $threshold';
}
