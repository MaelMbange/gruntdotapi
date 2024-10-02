library;

enum SGameVariant {
  none,
  campaign,
  forge,
  academy,
  academyTutorial,
  academyPractice,
  slayer,
  attrition,
  elimination,
  fiesta,
  swat,
  strongholds,
  koth,
  koth2,
  totalcontrol,
  ctf,
  assault,
  extraction,
  oddball,
  stockpile,
  juggernaut,
  regicide,
  infection,
  vip,
  escalation,
  grifball,
  race,
  prototype,
  test,
  academyTest,
  audioTest,
  campaignTest,
  engineTest,
  forgeTest,
  graphicsTest,
  multiplayerTest,
  sandboxTest,
  academyTraining,
  academyWeaponDrill,
  landGrab,
  tatanka,
  minigame,
  firefight,
}

class DefaultMode {
  Map<String, dynamic>? content;
  static const specificExcluded = ['assists', 'deaths', 'kda', 'kills'];

  DefaultMode({required this.content});

  Map<String, dynamic>? get modespecific {
    if (content == null) return null;
    Map<String, dynamic> result = Map<String, dynamic>.from(content!);
    result.removeWhere((key, value) => specificExcluded.contains(key));
    return result;
  }

  factory DefaultMode.fromJson(Map<String, dynamic> json) {
    return DefaultMode(content: json);
  }

  Map<String, dynamic>? toJson() => content;

  @override
  String toString() => 'content: $content';
}

class Modes {
  Map<String, DefaultMode>? modes;

  Modes({
    required this.modes,
  });

  factory Modes.fromJson(Map<String, dynamic> json) => Modes(
        modes: Map<String, DefaultMode>.from(
          json.map(
            (key, value) => MapEntry(
              key,
              DefaultMode.fromJson(value),
            ),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'modes': modes?.map((key, value) => MapEntry(key, value.toJson())),
      };

  @override
  String toString() => 'modes: $modes';
}
