library;

class Summary {
  int? kills;
  int? deaths;
  int? assists;
  int? betrayals;
  int? suicides;
  int? spawns;
  int? maxKillingSpree;
  SummaryVehicles? vehicles;
  SummaryMedals? medals;
  int? objectivesCompleted;

  Summary({
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.betrayals,
    required this.suicides,
    required this.spawns,
    required this.maxKillingSpree,
    required this.vehicles,
    required this.medals,
    required this.objectivesCompleted,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        kills: json['kills'],
        deaths: json['deaths'],
        assists: json['assists'],
        betrayals: json['betrayals'],
        suicides: json['suicides'],
        spawns: json['spawns'],
        maxKillingSpree: json['max_killing_spree'] ?? 0,
        vehicles: json['vehicles'] != null
            ? SummaryVehicles.fromJson(json['vehicles'])
            : null,
        medals: json['medals'] != null
            ? SummaryMedals.fromJson(json['medals'])
            : null,
        objectivesCompleted: json['objectives_completed'],
      );

  Map<String, dynamic> toJson() => {
        'kills': kills,
        'deaths': deaths,
        'assists': assists,
        'betrayals': betrayals,
        'suicides': suicides,
        'spawns': spawns,
        'max_killing_spree': maxKillingSpree,
        'vehicles': vehicles?.toJson(),
        'medals': medals?.toJson(),
        'objectives_completed': objectivesCompleted,
      };

  @override
  String toString() =>
      'kills: $kills, deaths: $deaths, assists: $assists, betrayals: $betrayals, suicides: $suicides, spawns: $spawns, max_killing_spree: $maxKillingSpree, vehicles: $vehicles, medals: $medals, objectives_completed: $objectivesCompleted';
}

class SummaryMedals {
  int? total;
  int? unique;

  SummaryMedals({
    required this.total,
    required this.unique,
  });

  factory SummaryMedals.fromJson(Map<String, dynamic> json) => SummaryMedals(
        total: json['total'],
        unique: json['unique'],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'unique': unique,
      };

  @override
  String toString() => 'total: $total, unique: $unique';
}

class SummaryVehicles {
  int? destroys;
  int? hijacks;

  SummaryVehicles({
    required this.destroys,
    required this.hijacks,
  });

  factory SummaryVehicles.fromJson(Map<String, dynamic> json) =>
      SummaryVehicles(
        destroys: json['destroys'],
        hijacks: json['hijacks'],
      );

  Map<String, dynamic> toJson() => {
        'destroys': destroys,
        'hijacks': hijacks,
      };

  @override
  String toString() => 'destroys: $destroys, hijacks: $hijacks';
}
