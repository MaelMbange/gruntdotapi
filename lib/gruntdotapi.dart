library gruntdotapi;

export 'src/article.dart';
export 'src/store/store.dart';
export 'src/metadata/export.dart';
export 'src/statistics/export.dart';

import 'src/metadata/export.dart';
import 'src/statistics/export.dart';
import 'src/network.dart' as net;

class Metadata {
  String token = '';

  List<Category>? categories;
  List<Enginevariant>? engineVariants;

  List<MMapClass>? maps;
  List<Currency>? currencies;
  List<CareerRank>? careerRanks;
  List<Manufacturer>? manufacturers;

  WeaklyReward? weaklyReward;

  List<MSeason>? seasons;
  List<MTeam>? teams;
  List<MMedal>? medals;

  Metadata({required this.token});

  Future<void> load() async {
    await _loadMedals();
    await _loadCategories();
    await _loadEngineVariants();
    await _loadMaps();
    await _loadCurrencies();
    await _loadCareerRanks();
    await _loadManufacturers();
    await _loadWeaklyReward();
    await _loadSeasons();
    await _loadTeams();
  }

  void setToken(String token) {
    this.token = token;
  }

  Future<void> _loadMedals() async {
    var response = await net.get(net.medalsUrl, token: token);
    medals = (response['data'] as List)
        .map<MMedal>((e) => MMedal.fromJson(e))
        .toList();
  }

  Future<void> _loadCategories() async {
    var response = await net.get(net.categoriesUrl, token: token);
    categories = (response['data'] as List)
        .map<Category>((e) => Category.fromJson(e))
        .toList();
  }

  Future<void> _loadEngineVariants() async {
    var response = await net.get(net.engineVariantsUrl, token: token);
    engineVariants = (response['data'] as List)
        .map<Enginevariant>((e) => Enginevariant.fromJson(e))
        .toList();
  }

  Future<void> _loadMaps() async {
    var response = await net.get(net.mapsUrl, token: token);
    maps = (response['data'] as List)
        .map<MMapClass>((e) => MMapClass.fromJson(e))
        .toList();
  }

  Future<void> _loadCurrencies() async {
    var response = await net.get(net.currenciesUrl, token: token);
    currencies = (response['data'] as List)
        .map<Currency>((e) => Currency.fromJson(e))
        .toList();
  }

  Future<void> _loadCareerRanks() async {
    var response = await net.get(net.careerRanksUrl, token: token);
    careerRanks = (response['data'] as List)
        .map<CareerRank>((e) => CareerRank.fromJson(e))
        .toList();
  }

  Future<void> _loadManufacturers() async {
    var response = await net.get(net.manufacturerUrl, token: token);
    manufacturers = (response['data'] as List)
        .map<Manufacturer>((e) => Manufacturer.fromJson(e))
        .toList();
  }

  Future<void> _loadWeaklyReward() async {
    var response = await net.get(net.weeklyRewardUrl, token: token);
    weaklyReward = WeaklyReward.fromJson(response['data']);
  }

  Future<void> _loadSeasons() async {
    var response = await net.get(net.seasonsUrl, token: token);
    seasons = (response['data'] as List)
        .map<MSeason>((e) => MSeason.fromJson(e))
        .toList();
  }

  Future<void> _loadTeams() async {
    var response = await net.get(net.teamsUrl, token: token);
    teams = (response['data'] as List)
        .map<MTeam>((e) => MTeam.fromJson(e))
        .toList();
  }
}

class Statistics {
  String gamertag = '';
  String token = '';

  int offset = 0;

  List<Match> matches = [];

  Statistics({required this.token, required this.gamertag});

  void setToken(String token) {
    this.token = token;
  }

  Future<void> setGamertag(String gamertag) async {
    this.gamertag = gamertag;
    await loadMatches();
  }

  void resetOffset() {
    offset = 0;
  }

  Future<void> loadMatches() async {
    var response = await net.get(
      net.matchesUrl
          .replaceAll('{gamertag}', gamertag)
          .replaceAll('{offset}', offset.toString())
          .replaceAll('{type}', 'matchmaking'),
      token: token,
    );

    if ((response['data'] as List).length == 25) {
      offset += 25;
    }

    matches.addAll((response['data'] as List)
        .map<Match>((e) => Match.fromJson(e))
        .toList());
  }

  Future<List<Match>> filterMatches(bool ranked) async {
    return matches
        .where((element) => element.details.playlist.ranked == ranked)
        .toList();
  }
}
