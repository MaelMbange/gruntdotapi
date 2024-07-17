library;

class Progression {
  SMatchCSRInfo? csr;

  Progression({required this.csr});

  factory Progression.fromJson(Map<String, dynamic> json) => Progression(
        csr: json['csr'] != null ? SMatchCSRInfo.fromJson(json['csr']) : null,
      );

  Map<String, dynamic> toJson() => {
        'csr': csr?.toJson(),
      };

  @override
  String toString() => 'csr: $csr';
}

class SMatchCSRInfo {
  SCSR preMatch;
  SCSR postMatch;

  SMatchCSRInfo({
    required this.preMatch,
    required this.postMatch,
  });

  factory SMatchCSRInfo.fromJson(Map<String, dynamic> json) => SMatchCSRInfo(
        preMatch: SCSR.fromJson(json['pre_match']),
        postMatch: SCSR.fromJson(json['post_match']),
      );

  Map<String, dynamic> toJson() => {
        'pre_match': preMatch.toJson(),
        'post_match': postMatch.toJson(),
      };

  @override
  String toString() => 'pre_match: $preMatch, post_match: $postMatch';
}

class SCSR {
  int value;
  int measurementMatchesRemaining;
  String tier;
  int tierStart;
  int subTier;
  String nextTier;
  int nextTierStart;
  int nextSubTier;
  int initialMeasurementMatches;
  int demotionProtectionMatchesRemaining;
  int initialDemotionProtectionMatches;
  String tierImageUrl;

  SCSR({
    required this.value,
    required this.measurementMatchesRemaining,
    required this.tier,
    required this.tierStart,
    required this.subTier,
    required this.nextTier,
    required this.nextTierStart,
    required this.nextSubTier,
    required this.initialMeasurementMatches,
    required this.demotionProtectionMatchesRemaining,
    required this.initialDemotionProtectionMatches,
    required this.tierImageUrl,
  });

  factory SCSR.fromJson(Map<String, dynamic> json) => SCSR(
        value: json['value'],
        measurementMatchesRemaining: json['measurement_matches_remaining'],
        tier: json['tier'],
        tierStart: json['tier_start'],
        subTier: json['sub_tier'],
        nextTier: json['next_tier'],
        nextTierStart: json['next_tier_start'],
        nextSubTier: json['next_sub_tier'],
        initialMeasurementMatches: json['initial_measurement_matches'],
        demotionProtectionMatchesRemaining:
            json['demotion_protection_matches_remaining'],
        initialDemotionProtectionMatches:
            json['initial_demotion_protection_matches'],
        tierImageUrl: json['tier_image_url'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'measurement_matches_remaining': measurementMatchesRemaining,
        'tier': tier,
        'tier_start': tierStart,
        'sub_tier': subTier,
        'next_tier': nextTier,
        'next_tier_start': nextTierStart,
        'next_sub_tier': nextSubTier,
        'initial_measurement_matches': initialMeasurementMatches,
        'demotion_protection_matches_remaining':
            demotionProtectionMatchesRemaining,
        'initial_demotion_protection_matches': initialDemotionProtectionMatches,
        'tier_image_url': tierImageUrl,
      };

  @override
  String toString() =>
      'value: $value, measurement_matches_remaining: $measurementMatchesRemaining, tier: $tier, tier_start: $tierStart, sub_tier: $subTier, next_tier: $nextTier, next_tier_start: $nextTierStart, next_sub_tier: $nextSubTier, initial_measurement_matches: $initialMeasurementMatches, demotion_protection_matches_remaining: $demotionProtectionMatchesRemaining, initial_demotion_protection_matches: $initialDemotionProtectionMatches, tier_image_url: $tierImageUrl';
}
