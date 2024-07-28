import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:gruntdotapi/src/network.dart';

class Statistics {
  /// [type] in {all, matchmaking, custom, local}
  static Future<List<Match>> loadMatches({
    required String token,
    required String gamertag,
    String type = 'matchmaking',
    int offset = 0,
    int count = 25,
  }) async {
    var response = await Network.get(
        matchesUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', type)
            .replaceAll('{offset}', offset.toString())
            .replaceAll('{count}', count.toString()),
        token: token);

    return (response['data'] as List)
        .map<Match>((e) => Match.fromJson(e))
        .toList();
  }

  static Future<MatchStats> loadMatchStats({
    required String token,
    required String matchId,
  }) async {
    var response = await Network.get(
        matchStatsUrl.replaceAll('{matchId}', matchId),
        token: token);

    return MatchStats.fromJson(response['data']);
  }

  ///[filter] in {all, ranked, social}
  static Future<MatchMade> loadGlobalStatistics({
    required String token,
    required String gamertag,
    String filter = 'all',
  }) async {
    var response = await Network.get(
        matchMadeUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{filter}', filter),
        token: token);

    return MatchMade.fromJson(response['data']);
  }

  static Future<Appearance> loadAppearance({
    required String token,
    required String gamertag,
  }) async {
    var response = await Network.get(
        appearanceUrl.replaceAll('{gamertag}', gamertag),
        token: token);

    return Appearance.fromJson(response['data']);
  }

  static Future<List<CSRS>> loadCSRS({
    required String token,
    required String gamertag,
  }) async {
    var response = await Network.get(csrUrl.replaceAll('{gamertag}', gamertag),
        token: token);

    return (response['data'] as List)
        .map<CSRS>((e) => CSRS.fromJson(e))
        .toList();
  }
}
