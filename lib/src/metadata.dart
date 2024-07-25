import 'metadata/export.dart';
import 'package:gruntdotapi/src/network.dart' as net;

class Metadata {
  List<Category> categories = [];
  List<Enginevariant> engineVariants = [];

  List<MMapClass> maps = [];
  List<Currency> currencies = [];
  List<CareerRank> careerRanks = [];
  List<Manufacturer> manufacturers = [];

  WeaklyReward? weaklyReward;

  List<MSeason> seasons = [];
  List<MTeam> teams = [];
  List<MMedal> medals = [];

  Future<void> loadAll(String token) async {
    if (medals.isEmpty) await loadMedals(token);
    if (categories.isEmpty) await loadCategories(token);
    if (engineVariants.isEmpty) await loadEngineVariants(token);
    if (maps.isEmpty) await loadMaps(token);
    if (currencies.isEmpty) await loadCurrencies(token);
    if (careerRanks.isEmpty) await loadCareerRanks(token);
    if (manufacturers.isEmpty) await loadManufacturers(token);
    if (weaklyReward == null) await loadWeaklyReward(token);
    if (seasons.isEmpty) await loadSeasons(token);
    if (teams.isEmpty) await loadTeams(token);
  }

  Future<List<MMedal>> loadMedals(String token) async {
    var response = await net.get(net.medalsUrl, token: token);
    medals = (response['data'] as List)
        .map<MMedal>((e) => MMedal.fromJson(e))
        .toList();
    return medals;
  }

  Future<List<Category>> loadCategories(String token) async {
    var response = await net.get(net.categoriesUrl, token: token);
    categories = (response['data'] as List)
        .map<Category>((e) => Category.fromJson(e))
        .toList();
    return categories;
  }

  Future<List<Enginevariant>> loadEngineVariants(String token) async {
    var response = await net.get(net.engineVariantsUrl, token: token);
    engineVariants = (response['data'] as List)
        .map<Enginevariant>((e) => Enginevariant.fromJson(e))
        .toList();
    return engineVariants;
  }

  Future<List<MMapClass>> loadMaps(String token) async {
    var response = await net.get(net.mapsUrl, token: token);
    maps = (response['data'] as List)
        .map<MMapClass>((e) => MMapClass.fromJson(e))
        .toList();
    return maps;
  }

  Future<List<Currency>> loadCurrencies(String token) async {
    var response = await net.get(net.currenciesUrl, token: token);
    currencies = (response['data'] as List)
        .map<Currency>((e) => Currency.fromJson(e))
        .toList();
    return currencies;
  }

  Future<List<CareerRank>> loadCareerRanks(String token) async {
    var response = await net.get(net.careerRanksUrl, token: token);
    careerRanks = (response['data'] as List)
        .map<CareerRank>((e) => CareerRank.fromJson(e))
        .toList();
    return careerRanks;
  }

  Future<List<Manufacturer>> loadManufacturers(String token) async {
    var response = await net.get(net.manufacturerUrl, token: token);
    manufacturers = (response['data'] as List)
        .map<Manufacturer>((e) => Manufacturer.fromJson(e))
        .toList();
    return manufacturers;
  }

  Future<WeaklyReward?> loadWeaklyReward(String token) async {
    var response = await net.get(net.weeklyRewardUrl, token: token);
    weaklyReward = WeaklyReward.fromJson(response['data']);

    return weaklyReward;
  }

  Future<List<MSeason>> loadSeasons(String token) async {
    var response = await net.get(net.seasonsUrl, token: token);
    seasons = (response['data'] as List)
        .map<MSeason>((e) => MSeason.fromJson(e))
        .toList();
    return seasons;
  }

  Future<List<MTeam>> loadTeams(String token) async {
    var response = await net.get(net.teamsUrl, token: token);
    teams = (response['data'] as List)
        .map<MTeam>((e) => MTeam.fromJson(e))
        .toList();
    return teams;
  }

  @override
  String toString() {
    if (weaklyReward != null &&
        categories.isNotEmpty &&
        engineVariants.isNotEmpty &&
        maps.isNotEmpty &&
        currencies.isNotEmpty &&
        careerRanks.isNotEmpty &&
        manufacturers.isNotEmpty &&
        seasons.isNotEmpty &&
        teams.isNotEmpty &&
        medals.isNotEmpty) {
      return 'All metadata loaded';
    } else {
      return 'All metadata not loaded';
    }
  }
}
