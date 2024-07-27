import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:gruntdotapi/src/network.dart' as net;

class Statistics {
  /// [type] in {all, matchmaking, custom, local}
  static Future<List<Match>> loadMatches(String token, String gamertag,
      {String type = 'matchmaking', int offset = 0, int count = 25}) async {
    var response = await net.get(
        net.matchesUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', type)
            .replaceAll('{offset}', offset.toString())
            .replaceAll('{count}', count.toString()),
        token: token);

    return (response['data'] as List)
        .map<Match>((e) => Match.fromJson(e))
        .toList();
  }

  static Future<MatchStats> loadMatchStats(String token, String matchId) async {
    var response = await net
        .get(net.matchStatsUrl.replaceAll('{matchId}', matchId), token: token);

    return MatchStats.fromJson(response['data']);
  }

  ///[filter] in {all, ranked, social}
  static Future<MatchMade> loadGlobalStatistics(String token, String gamertag,
      {String filter = 'all'}) async {
    var response = await net.get(
        net.matchMadeUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{filter}', filter),
        token: token);

    return MatchMade.fromJson(response['data']);
  }

  static Future<Appearance> loadAppearance(
      String token, String gamertag) async {
    var response = await net.get(
        net.appearanceUrl.replaceAll('{gamertag}', gamertag),
        token: token);

    return Appearance.fromJson(response['data']);
  }

  static Future<List<CSRS>> loadCSRS(String token, String gamertag) async {
    var response = await net.get(net.csrUrl.replaceAll('{gamertag}', gamertag),
        token: token);

    return (response['data'] as List)
        .map<CSRS>((e) => CSRS.fromJson(e))
        .toList();
  }
}
