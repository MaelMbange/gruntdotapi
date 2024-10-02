library;

class Participation {
  dynamic confirmed;
  bool? joinedInProgress;
  DateTime? joinedAt;
  DateTime? leftAt;
  Presence? presence;

  Participation({
    required this.confirmed,
    required this.joinedInProgress,
    required this.joinedAt,
    required this.leftAt,
    required this.presence,
  });

  factory Participation.fromJson(Map<String, dynamic> json) => Participation(
        confirmed: json['confirmed'],
        joinedInProgress: json['joined_in_progress'],
        joinedAt: json['joined_at'] != null
            ? DateTime.parse(json['joined_at'])
            : null,
        leftAt:
            json['left_at'] != null ? DateTime.parse(json['left_at']) : null,
        presence: json['presence'] != null
            ? Presence.fromJson(json['presence'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'confirmed': confirmed,
        'joined_in_progress': joinedInProgress,
        'joined_at': joinedAt?.toIso8601String(),
        'left_at': leftAt?.toIso8601String(),
        'presence': presence?.toJson(),
      };

  @override
  String toString() =>
      'confirmed: $confirmed, joined_in_progress: $joinedInProgress, joined_at: $joinedAt, left_at: $leftAt, presence: $presence';
}

class Presence {
  bool? beginning;
  bool? completion;

  Presence({
    required this.beginning,
    required this.completion,
  });

  factory Presence.fromJson(Map<String, dynamic> json) => Presence(
        beginning: json['beginning'],
        completion: json['completion'],
      );

  Map<String, dynamic> toJson() => {
        'beginning': beginning,
        'completion': completion,
      };

  @override
  String toString() => 'beginning: $beginning, completion: $completion';
}
