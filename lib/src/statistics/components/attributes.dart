library;

class Attributes {
  bool? resolved;

  Attributes({this.resolved = false});

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        resolved: json['resolved'],
      );

  Map<String, dynamic> toJson() => {
        'resolved': resolved,
      };

  @override
  String toString() => 'resolved: $resolved';
}
