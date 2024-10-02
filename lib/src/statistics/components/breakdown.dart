library;

class Breakdown {
  BreakdownKills? kills;
  BreakdownAssists? assists;
  BreakdownVehicles? vehicles;
  List<BreakdownMedal>? medals;

  Breakdown({
    required this.kills,
    required this.assists,
    required this.vehicles,
    required this.medals,
  });

  factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
        kills: json['kills'] != null
            ? BreakdownKills.fromJson(json['kills'])
            : null,
        assists: json['assists'] != null
            ? BreakdownAssists.fromJson(json['assists'])
            : null,
        vehicles: json['vehicles'] != null
            ? BreakdownVehicles.fromJson(json['vehicles'])
            : null,
        medals: List<BreakdownMedal>.from(
            json['medals'].map((medal) => BreakdownMedal.fromJson(medal))),
      );

  Map<String, dynamic> toJson() => {
        'kills': kills?.toJson(),
        'assists': assists?.toJson(),
        'vehicles': vehicles?.toJson(),
        'medals': medals?.map((medal) => medal.toJson()).toList(),
      };

  @override
  String toString() =>
      'kills: $kills, assists: $assists, vehicles: $vehicles, medals: $medals';
}

class BreakdownAssists {
  int? emp;
  int? driver;
  int? callouts;

  BreakdownAssists({
    required this.emp,
    required this.driver,
    required this.callouts,
  });

  factory BreakdownAssists.fromJson(Map<String, dynamic> json) =>
      BreakdownAssists(
        emp: json['emp'],
        driver: json['driver'],
        callouts: json['callouts'],
      );

  Map<String, dynamic> toJson() => {
        'emp': emp,
        'driver': driver,
        'callouts': callouts,
      };

  @override
  String toString() => 'emp: $emp, driver: $driver, callouts: $callouts';
}

class BreakdownMedal {
  int? id;
  int? count;

  BreakdownMedal({
    required this.id,
    required this.count,
  });

  factory BreakdownMedal.fromJson(Map<String, dynamic> json) => BreakdownMedal(
        id: json['id'],
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'count': count,
      };

  @override
  String toString() => 'id: $id, count: $count';
}

class BreakdownVehicles {
  List<dynamic>? destroys;
  List<dynamic>? hijacks;

  BreakdownVehicles({
    required this.destroys,
    required this.hijacks,
  });

  factory BreakdownVehicles.fromJson(Map<String, dynamic> json) =>
      BreakdownVehicles(
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

class BreakdownKills {
  int? melee;
  int? grenades;
  int? headshots;
  int? powerWeapons;
  int? sticks;
  int? assassinations;
  KillsVehicles? vehicles;
  KillsMiscellaneous? miscellaneous;

  BreakdownKills({
    required this.melee,
    required this.grenades,
    required this.headshots,
    required this.powerWeapons,
    required this.sticks,
    required this.assassinations,
    required this.vehicles,
    required this.miscellaneous,
  });

  factory BreakdownKills.fromJson(Map<String, dynamic> json) => BreakdownKills(
        melee: json['melee'],
        grenades: json['grenades'],
        headshots: json['headshots'],
        powerWeapons: json['power_weapons'],
        sticks: json['sticks'],
        assassinations: json['assassinations'],
        vehicles: json['vehicles'] != null
            ? KillsVehicles.fromJson(json['vehicles'])
            : null,
        miscellaneous: json['miscellaneous'] != null
            ? KillsMiscellaneous.fromJson(json['miscellaneous'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'melee': melee,
        'grenades': grenades,
        'headshots': headshots,
        'power_weapons': powerWeapons,
        'sticks': sticks,
        'assassinations': assassinations,
        'vehicles': vehicles?.toJson(),
        'miscellaneous': miscellaneous?.toJson(),
      };

  @override
  String toString() =>
      'melee: $melee, grenades: $grenades, headshots: $headshots, power_weapons: $powerWeapons, sticks: $sticks, assassinations: $assassinations, vehicles: $vehicles, miscellaneous: $miscellaneous';
}

class KillsMiscellaneous {
  int? repulsor;
  int? fusionCoils;

  KillsMiscellaneous({
    required this.repulsor,
    required this.fusionCoils,
  });

  factory KillsMiscellaneous.fromJson(Map<String, dynamic> json) =>
      KillsMiscellaneous(
        repulsor: json['repulsor'],
        fusionCoils: json['fusion_coils'],
      );

  Map<String, dynamic> toJson() => {
        'repulsor': repulsor,
        'fusion_coils': fusionCoils,
      };

  @override
  String toString() => 'repulsor: $repulsor, fusion_coils: $fusionCoils';
}

class KillsVehicles {
  int? splatters;

  KillsVehicles({
    required this.splatters,
  });

  factory KillsVehicles.fromJson(Map<String, dynamic> json) => KillsVehicles(
        splatters: json['splatters'],
      );

  Map<String, dynamic> toJson() => {
        'splatters': splatters,
      };

  @override
  String toString() => 'splatters: $splatters';
}
