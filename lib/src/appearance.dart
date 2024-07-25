library;

class Appearance {
  String serviceTag;
  String emblem;
  String nameplate;
  String backdrop;
  String actionPose;

  Appearance(
      {required this.serviceTag,
      required this.emblem,
      required this.nameplate,
      required this.backdrop,
      required this.actionPose});

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
      serviceTag: json['service_tag'],
      emblem: json['image_urls']['emblem'],
      nameplate: json['image_urls']['nameplate'],
      backdrop: json['image_urls']['backdrop'],
      actionPose: json['image_urls']['action_pose']);

  Map<String, dynamic> toJson() => {
        'service_tag': serviceTag,
        'image_urls': {
          'emblem': emblem,
          'nameplate': nameplate,
          'backdrop': backdrop,
          'action_pose': actionPose
        }
      };

  @override
  String toString() =>
      'service_tag: $serviceTag, emblem: $emblem, nameplate: $nameplate, backdrop: $backdrop, action_pose: $actionPose';
}
