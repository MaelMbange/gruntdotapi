import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

class Statistics {
  /// [type] in {all, matchmaking, custom, local}
  static Future<List<Match>> loadMatches({
    String? route,
    required ApiKey? authenticationKey,
    required String gamertag,
    String type = 'matchmaking',
    int offset = 0,
    int count = 25,
  }) async {
    if (count > 25) {
      throw BadArgumentException(message: 'Count must be less than 25');
    }

    http.Response response = await Gruntdotapi.request(
        route: (route ?? Routes.playerMatches)
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', type)
            .replaceAll('{offset}', offset.toString())
            .replaceAll('{count}', count.toString()),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: Match.fromJson);
  }

  static Future<MatchStats> loadMatchStats({
    String? route,
    required ApiKey? authenticationKey,
    required String matchId,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.matchStats).replaceAll('{matchId}', matchId),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: MatchStats.fromJson);
  }

  ///[filter] in {all, ranked, social}
  static Future<MatchMade> loadGlobalStatistics({
    String? route,
    required ApiKey? authenticationKey,
    required String gamertag,
    String filter = 'all',
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerGlobalStats)
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{filter}', filter),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: MatchMade.fromJson);
  }

  static Future<Appearance> loadAppearance({
    String? route,
    required ApiKey? authenticationKey,
    required String gamertag,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerAppearance)
            .replaceAll('{gamertag}', gamertag),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: Appearance.fromJson);
  }

  static Future<List<CSRS>> loadCSRS({
    String? route,
    required ApiKey? authenticationKey,
    required String gamertag,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerCsrs).replaceAll('{gamertag}', gamertag),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: CSRS.fromJson);
  }

  static Future<CareerRank> loadCareerRank({
    String? route,
    required ApiKey? authenticationKey,
    required String gamertag,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerCareerRank)
            .replaceAll('{gamertag}', gamertag),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: CareerRank.fromJson);
  }
}
