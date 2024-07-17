library;

class TimeDuration {
  int seconds;
  String human;

  TimeDuration({
    required this.seconds,
    required this.human,
  });

  factory TimeDuration.fromJson(Map<String, dynamic> json) {
    return TimeDuration(
      seconds: json['seconds'],
      human: json['human'],
    );
  }

  Map<String, dynamic> toJson() => {
        'seconds': seconds,
        'human': human,
      };

  @override
  String toString() => 'seconds: $seconds, human: $human';
}
