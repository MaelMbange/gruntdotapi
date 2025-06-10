import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

/// Utility class for loading various player statistics and information via the Gruntdotapi API.
class Statistics {
  /// Loads a list of matches for a player.
  ///
  /// [type]: Type of match to filter ('all', 'matchmaking', 'custom', 'local').
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [gamertag]: Player's gamertag (required).
  /// [offset]: Pagination offset (default: 0).
  /// [count]: Number of results to return (max 25, default: 25).
  ///
  /// Returns a list of [Match] objects.
  static Future<List<Match>> loadMatches({
    String? route,
    ApiKey? authenticationKey,
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

  /// Loads detailed statistics for a specific match.
  ///
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [matchId]: Match identifier (required).
  ///
  /// Returns a [MatchStats] object.
  static Future<MatchStats> loadMatchStats({
    String? route,
    ApiKey? authenticationKey,
    required String matchId,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.matchStats).replaceAll('{matchId}', matchId),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: MatchStats.fromJson);
  }

  /// Loads global statistics for a player.
  ///
  /// [filter]: Filter to apply ('all', 'ranked', 'social').
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [gamertag]: Player's gamertag (required).
  ///
  /// Returns a [MatchMade] object.
  static Future<MatchMade> loadGlobalStatistics({
    String? route,
    ApiKey? authenticationKey,
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

  /// Loads the player's appearance (avatar, colors, etc).
  ///
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [gamertag]: Player's gamertag (required).
  ///
  /// Returns an [Appearance] object.
  static Future<Appearance> loadAppearance({
    String? route,
    ApiKey? authenticationKey,
    required String gamertag,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerAppearance)
            .replaceAll('{gamertag}', gamertag),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: Appearance.fromJson);
  }

  /// Loads the list of CSR (Competitive Skill Rank) for the player.
  ///
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [gamertag]: Player's gamertag (required).
  ///
  /// Returns a list of [CSRS] objects.
  static Future<List<CSRS>> loadCSRS({
    String? route,
    ApiKey? authenticationKey,
    required String gamertag,
  }) async {
    var response = await Gruntdotapi.request(
        route: (route ?? Routes.playerCsrs).replaceAll('{gamertag}', gamertag),
        authenticationKey: authenticationKey);

    return Gruntdotapi.fetchResponse(
        response: response, fromJson: CSRS.fromJson);
  }

  /// Loads the player's career rank.
  ///
  /// [route]: Custom API route (optional).
  /// [authenticationKey]: API key for authentication (optional).
  /// [gamertag]: Player's gamertag (required).
  ///
  /// Returns a [CareerRank] object.
  static Future<CareerRank> loadCareerRank({
    String? route,
    ApiKey? authenticationKey,
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
