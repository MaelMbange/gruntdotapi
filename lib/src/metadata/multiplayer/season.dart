/// Description of the class [MSeason]
///
/// Is the representation of a season of the game
library;

class MSeason {
  final int? id;
  final int? version;
  final String? name;
  final String? description;
  final String? narrativeBlurp;

  final String? seasonLogo;
  final String? cardBackground;
  final String? challengesBackground;
  final String? battlepassBackground;
  final String? storefrontBackground;

  final DateTime? startDate;
  final DateTime? endDate;

  MSeason({
    required this.id,
    required this.version,
    required this.name,
    required this.description,
    required this.narrativeBlurp,
    required this.seasonLogo,
    required this.cardBackground,
    required this.challengesBackground,
    required this.battlepassBackground,
    required this.storefrontBackground,
    required this.startDate,
    required this.endDate,
  });

  factory MSeason.fromJson(Map<String, dynamic> json) => MSeason(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        description: json['description'],
        narrativeBlurp: json['narrative_blurb'],
        seasonLogo: json['image_urls']['season_logo'],
        cardBackground: json['image_urls']['card_background'],
        challengesBackground: json['image_urls']['challenges_background'],
        battlepassBackground: json['image_urls']['battlepass_background'],
        storefrontBackground: json['image_urls']['storefront_background'],
        startDate: json['availability'][0]['start_date'] != null
            ? DateTime.parse(json['availability'][0]['start_date'])
            : null,
        endDate: json['availability'][0]['end_date'] != null
            ? DateTime.parse(json['availability'][0]['end_date'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
        'name': name,
        'description': description,
        'narrative_blurb': narrativeBlurp,
        'image_urls': {
          'season_logo': seasonLogo,
          'card_background': cardBackground,
          'challenges_background': challengesBackground,
          'battlepass_background': battlepassBackground,
          'storefront_background': storefrontBackground,
        },
        'availability': [
          {
            'start_date': startDate?.toIso8601String(),
            'end_date': endDate?.toIso8601String(),
          }
        ],
      };

  @override
  String toString() {
    return 'id: $id, version: $version, name: $name, description: $description, narrativeBlurp: $narrativeBlurp, seasonLogo: $seasonLogo, cardBackground: $cardBackground, challengesBackground: $challengesBackground, battlepassBackground: $battlepassBackground, storefrontBackground: $storefrontBackground, startDate: $startDate, endDate: $endDate';
  }
}
