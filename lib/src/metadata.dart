import 'metadata/export.dart';
import 'package:gruntdotapi/src/network.dart';

abstract class Metadata {
  static List<Category> categories = [];
  static List<Enginevariant> engineVariants = [];

  static List<MMapClass> maps = [];
  static List<Currency> currencies = [];
  static List<CareerRank> careerRanks = [];
  static List<Manufacturer> manufacturers = [];

  static WeaklyReward? weaklyReward;

  static List<MSeason> seasons = [];
  static List<MTeam> teams = [];
  static List<MMedal> medals = [];

  static Future<void> loadAll(String token) async {
    if (categories.isEmpty) await loadCategories(token: token);
    if (engineVariants.isEmpty) await loadEngineVariants(token: token);
    if (maps.isEmpty) await loadMaps(token: token);
    if (currencies.isEmpty) await loadCurrencies(token: token);
    if (careerRanks.isEmpty) await loadCareerRanks(token: token);
    if (manufacturers.isEmpty) await loadManufacturers(token: token);
    if (weaklyReward == null) await loadWeaklyReward(token: token);
    if (seasons.isEmpty) await loadSeasons(token: token);
    if (teams.isEmpty) await loadTeams(token: token);
    if (medals.isEmpty) await loadMedals(token: token);
  }

  static Future<List<Category>> loadCategories({required String token}) async {
    if (categories.isNotEmpty) return categories;

    var response = await Network.get(categoriesUrl, token: token);
    categories = (response['data'] as List)
        .map<Category>((e) => Category.fromJson(e))
        .toList();

    return categories;
  }

  static Future<List<Enginevariant>> loadEngineVariants(
      {required String token}) async {
    if (engineVariants.isNotEmpty) return engineVariants;

    var response = await Network.get(engineVariantsUrl, token: token);
    engineVariants = (response['data'] as List)
        .map<Enginevariant>((e) => Enginevariant.fromJson(e))
        .toList();

    return engineVariants;
  }

  static Future<List<MMapClass>> loadMaps({required String token}) async {
    if (maps.isNotEmpty) return maps;

    var response = await Network.get(mapsUrl, token: token);
    maps = (response['data'] as List)
        .map<MMapClass>((e) => MMapClass.fromJson(e))
        .toList();

    return maps;
  }

  static Future<List<Currency>> loadCurrencies({required String token}) async {
    if (currencies.isNotEmpty) return currencies;

    var response = await Network.get(currenciesUrl, token: token);
    currencies = (response['data'] as List)
        .map<Currency>((e) => Currency.fromJson(e))
        .toList();

    return currencies;
  }

  static Future<List<CareerRank>> loadCareerRanks(
      {required String token}) async {
    if (careerRanks.isNotEmpty) return careerRanks;

    var response = await Network.get(careerRanksUrl, token: token);
    careerRanks = (response['data'] as List)
        .map<CareerRank>((e) => CareerRank.fromJson(e))
        .toList();

    return careerRanks;
  }

  static Future<List<Manufacturer>> loadManufacturers(
      {required String token}) async {
    if (manufacturers.isNotEmpty) return manufacturers;

    var response = await Network.get(manufacturerUrl, token: token);
    manufacturers = (response['data'] as List)
        .map<Manufacturer>((e) => Manufacturer.fromJson(e))
        .toList();

    return manufacturers;
  }

  static Future<WeaklyReward?> loadWeaklyReward({required String token}) async {
    if (weaklyReward != null) return weaklyReward;

    var response = await Network.get(weeklyRewardUrl, token: token);
    weaklyReward = WeaklyReward.fromJson(response['data']);

    return weaklyReward;
  }

  static Future<List<MSeason>> loadSeasons({required String token}) async {
    if (seasons.isNotEmpty) return seasons;

    var response = await Network.get(seasonsUrl, token: token);
    seasons = (response['data'] as List)
        .map<MSeason>((e) => MSeason.fromJson(e))
        .toList();

    return seasons;
  }

  static Future<List<MTeam>> loadTeams({required String token}) async {
    if (teams.isNotEmpty) return teams;

    var response = await Network.get(teamsUrl, token: token);
    teams = (response['data'] as List)
        .map<MTeam>((e) => MTeam.fromJson(e))
        .toList();

    return teams;
  }

  static Future<List<MMedal>> loadMedals({required String token}) async {
    if (medals.isNotEmpty) return medals;

    var response = await Network.get(medalsUrl, token: token);
    medals = (response['data'] as List)
        .map<MMedal>((e) => MMedal.fromJson(e))
        .toList();

    return medals;
  }

  static bool isLoaded() {
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
      return true;
    }
    return false;
  }
}
