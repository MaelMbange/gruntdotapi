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
  Map<String, dynamic> content;

  DefaultMode({required this.content});

  factory DefaultMode.fromJson(Map<String, dynamic> json) => DefaultMode(
        content: json,
      );

  Map<String, dynamic> toJson() => content;
}
