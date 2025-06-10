import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

/// Provides static methods to load and cache game metadata such as categories, engine variants, maps, currencies, ranks, manufacturers, rewards, seasons, teams, and medals.
///
/// All methods require a valid [ApiKey] for authentication and rate limit management.
abstract class Metadata {
  static List<Category> categories = [];
  static List<Enginevariant> engineVariants = [];

  static List<MMapClass> maps = [];
  static List<Currency> currencies = [];
  static List<MCareerRank> careerRanks = [];
  static List<Manufacturer> manufacturers = [];

  static WeaklyReward? weaklyReward;

  static List<MSeason> seasons = [];
  static List<MTeam> teams = [];
  static List<MMedal> medals = [];

  /// Loads all metadata types if not already loaded. Throws [NotEnoughRequestException] if rate limit is too low.
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

  /// Loads and caches the list of categories. Returns the cached list if already loaded.
  static Future<List<Category>> loadCategories(
      {String? route, ApiKey? authenticationKey}) async {
    if (categories.isNotEmpty) return categories;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.categories),
        authenticationKey: authenticationKey);

    categories = Gruntdotapi.fetchResponse(
        response: response, fromJson: Category.fromJson);

    return categories;
  }

  /// Loads and caches the list of engine variants. Returns the cached list if already loaded.
  static Future<List<Enginevariant>> loadEngineVariants(
      {String? route, ApiKey? authenticationKey}) async {
    if (engineVariants.isNotEmpty) return engineVariants;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.engineVariants),
        authenticationKey: authenticationKey);

    engineVariants = Gruntdotapi.fetchResponse(
        response: response, fromJson: Enginevariant.fromJson);

    return engineVariants;
  }

  /// Loads and caches the list of maps. Returns the cached list if already loaded.
  static Future<List<MMapClass>> loadMaps(
      {String? route, ApiKey? authenticationKey}) async {
    if (maps.isNotEmpty) return maps;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.maps), authenticationKey: authenticationKey);

    maps = Gruntdotapi.fetchResponse(
        response: response, fromJson: MMapClass.fromJson);

    return maps;
  }

  /// Loads and caches the list of currencies. Returns the cached list if already loaded.
  static Future<List<Currency>> loadCurrencies(
      {String? route, ApiKey? authenticationKey}) async {
    if (currencies.isNotEmpty) return currencies;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.currencies),
        authenticationKey: authenticationKey);

    currencies = Gruntdotapi.fetchResponse(
        response: response, fromJson: Currency.fromJson);

    return currencies;
  }

  /// Loads and caches the list of career ranks. Returns the cached list if already loaded.
  static Future<List<MCareerRank>> loadCareerRanks(
      {String? route, ApiKey? authenticationKey}) async {
    if (careerRanks.isNotEmpty) return careerRanks;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.careerRanks),
        authenticationKey: authenticationKey);

    careerRanks = Gruntdotapi.fetchResponse(
        response: response, fromJson: MCareerRank.fromJson);

    return careerRanks;
  }

  /// Loads and caches the list of manufacturers. Returns the cached list if already loaded.
  static Future<List<Manufacturer>> loadManufacturers(
      {String? route, ApiKey? authenticationKey}) async {
    if (manufacturers.isNotEmpty) return manufacturers;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.manufacturers),
        authenticationKey: authenticationKey);

    manufacturers = Gruntdotapi.fetchResponse(
        response: response, fromJson: Manufacturer.fromJson);

    return manufacturers;
  }

  /// Loads and caches the weakly reward data. Returns the cached data if already loaded.
  static Future<WeaklyReward?> loadWeaklyReward(
      {String? route, ApiKey? authenticationKey}) async {
    if (weaklyReward != null) return weaklyReward;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.weeklyReward),
        authenticationKey: authenticationKey);

    weaklyReward = Gruntdotapi.fetchResponse(
        response: response, fromJson: WeaklyReward.fromJson);

    return weaklyReward;
  }

  /// Loads and caches the list of seasons. Returns the cached list if already loaded.
  static Future<List<MSeason>> loadSeasons(
      {String? route, ApiKey? authenticationKey}) async {
    if (seasons.isNotEmpty) return seasons;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.seasons), authenticationKey: authenticationKey);

    seasons = Gruntdotapi.fetchResponse(
        response: response, fromJson: MSeason.fromJson);

    return seasons;
  }

  /// Loads and caches the list of teams. Returns the cached list if already loaded.
  static Future<List<MTeam>> loadTeams(
      {String? route, ApiKey? authenticationKey}) async {
    if (teams.isNotEmpty) return teams;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.teams), authenticationKey: authenticationKey);

    teams =
        Gruntdotapi.fetchResponse(response: response, fromJson: MTeam.fromJson);

    return teams;
  }

  /// Loads and caches the list of medals. Returns the cached list if already loaded.
  static Future<List<MMedal>> loadMedals(
      {String? route, ApiKey? authenticationKey}) async {
    if (medals.isNotEmpty) return medals;

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.medals), authenticationKey: authenticationKey);

    medals = Gruntdotapi.fetchResponse(
        response: response, fromJson: MMedal.fromJson);

    return medals;
  }

  /// Checks if all metadata has been loaded.
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
