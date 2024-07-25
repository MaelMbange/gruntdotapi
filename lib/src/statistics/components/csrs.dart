part of 'progression.dart';

class CSRS {
  String id;
  String name;
  CSRSProperties properties;

  CSR current;
  CSR season;
  CSR allTime;

  CSRS({
    required this.id,
    required this.name,
    required this.properties,
    required this.current,
    required this.season,
    required this.allTime,
  });

  factory CSRS.fromJson(Map<String, dynamic> json) {
    return CSRS(
      id: json['id'],
      name: json['name'],
      properties: CSRSProperties.fromJson(json['properties']),
      current: CSR.fromJson(json['response']['current']),
      season: CSR.fromJson(json['response']['season']),
      allTime: CSR.fromJson(json['response']['all_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'properties': properties.toJson(),
      'response': {
        'current': current.toJson(),
        'season': season.toJson(),
        'all_time': allTime.toJson(),
      },
    };
  }

  @override
  String toString() =>
      'id: $id, name: $name, properties: $properties, current: $current, season: $season, allTime: $allTime';
}

class CSRSProperties {
  String queue;
  String input;
  String experience;

  CSRSProperties({
    required this.queue,
    required this.input,
    required this.experience,
  });

  factory CSRSProperties.fromJson(Map<String, dynamic> json) {
    return CSRSProperties(
      queue: json['queue'],
      input: json['input'],
      experience: json['experience'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'queue': queue,
      'input': input,
      'experience': experience,
    };
  }

  @override
  String toString() => 'queue: $queue, input: $input, experience: $experience';
}
