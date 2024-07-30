import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

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

  static Future<void> loadAll({required ApiKey authenticationKey}) async {
    if (authenticationKey.ratelimitRemaining < 10) {
      throw NotEnoughRequestException();
    }
    if (categories.isEmpty) {
      await loadCategories(authenticationKey: authenticationKey);
    }
    if (engineVariants.isEmpty) {
      await loadEngineVariants(authenticationKey: authenticationKey);
    }
    if (maps.isEmpty) {
      await loadMaps(authenticationKey: authenticationKey);
    }
    if (currencies.isEmpty) {
      await loadCurrencies(authenticationKey: authenticationKey);
    }
    if (careerRanks.isEmpty) {
      await loadCareerRanks(authenticationKey: authenticationKey);
    }
    if (manufacturers.isEmpty) {
      await loadManufacturers(authenticationKey: authenticationKey);
    }
    if (weaklyReward == null) {
      await loadWeaklyReward(authenticationKey: authenticationKey);
    }
    if (seasons.isEmpty) {
      await loadSeasons(authenticationKey: authenticationKey);
    }
    if (teams.isEmpty) {
      await loadTeams(authenticationKey: authenticationKey);
    }
    if (medals.isEmpty) {
      await loadMedals(authenticationKey: authenticationKey);
    }
  }

  static Future<List<Category>> loadCategories(
      {required ApiKey authenticationKey}) async {
    if (categories.isNotEmpty) return categories;

    http.Response response = await Gruntdotapi.request(
        route: Routes.categories, authenticationKey: authenticationKey);

    categories = Gruntdotapi.fetchResponse(
        response: response, fromJson: Category.fromJson);

    return categories;
  }

  static Future<List<Enginevariant>> loadEngineVariants(
      {required ApiKey authenticationKey}) async {
    if (engineVariants.isNotEmpty) return engineVariants;

    http.Response response = await Gruntdotapi.request(
        route: Routes.engineVariants, authenticationKey: authenticationKey);

    engineVariants = Gruntdotapi.fetchResponse(
        response: response, fromJson: Enginevariant.fromJson);

    return engineVariants;
  }

  static Future<List<MMapClass>> loadMaps(
      {required ApiKey authenticationKey}) async {
    if (maps.isNotEmpty) return maps;

    http.Response response = await Gruntdotapi.request(
        route: Routes.maps, authenticationKey: authenticationKey);

    maps = Gruntdotapi.fetchResponse(
        response: response, fromJson: MMapClass.fromJson);

    return maps;
  }

  static Future<List<Currency>> loadCurrencies(
      {required ApiKey authenticationKey}) async {
    if (currencies.isNotEmpty) return currencies;

    http.Response response = await Gruntdotapi.request(
        route: Routes.currencies, authenticationKey: authenticationKey);

    currencies = Gruntdotapi.fetchResponse(
        response: response, fromJson: Currency.fromJson);

    return currencies;
  }

  static Future<List<CareerRank>> loadCareerRanks(
      {required ApiKey authenticationKey}) async {
    if (careerRanks.isNotEmpty) return careerRanks;

    http.Response response = await Gruntdotapi.request(
        route: Routes.careerRanks, authenticationKey: authenticationKey);

    careerRanks = Gruntdotapi.fetchResponse(
        response: response, fromJson: CareerRank.fromJson);

    return careerRanks;
  }

  static Future<List<Manufacturer>> loadManufacturers(
      {required ApiKey authenticationKey}) async {
    if (manufacturers.isNotEmpty) return manufacturers;

    http.Response response = await Gruntdotapi.request(
        route: Routes.manufacturers, authenticationKey: authenticationKey);

    manufacturers = Gruntdotapi.fetchResponse(
        response: response, fromJson: Manufacturer.fromJson);

    return manufacturers;
  }

  static Future<WeaklyReward?> loadWeaklyReward(
      {required ApiKey authenticationKey}) async {
    if (weaklyReward != null) return weaklyReward;

    http.Response response = await Gruntdotapi.request(
        route: Routes.weeklyReward, authenticationKey: authenticationKey);

    weaklyReward = Gruntdotapi.fetchResponse(
        response: response, fromJson: WeaklyReward.fromJson);

    return weaklyReward;
  }

  static Future<List<MSeason>> loadSeasons(
      {required ApiKey authenticationKey}) async {
    if (seasons.isNotEmpty) return seasons;

    http.Response response = await Gruntdotapi.request(
        route: Routes.seasons, authenticationKey: authenticationKey);

    seasons = Gruntdotapi.fetchResponse(
        response: response, fromJson: MSeason.fromJson);

    return seasons;
  }

  static Future<List<MTeam>> loadTeams(
      {required ApiKey authenticationKey}) async {
    if (teams.isNotEmpty) return teams;

    http.Response response = await Gruntdotapi.request(
        route: Routes.teams, authenticationKey: authenticationKey);

    teams =
        Gruntdotapi.fetchResponse(response: response, fromJson: MTeam.fromJson);

    return teams;
  }

  static Future<List<MMedal>> loadMedals(
      {required ApiKey authenticationKey}) async {
    if (medals.isNotEmpty) return medals;

    http.Response response = await Gruntdotapi.request(
        route: Routes.medals, authenticationKey: authenticationKey);

    medals = Gruntdotapi.fetchResponse(
        response: response, fromJson: MMedal.fromJson);

    return medals;
  }

  static bool isAllDataLoaded() {
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
