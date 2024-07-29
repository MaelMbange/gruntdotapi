library network;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'exception.dart';

const String baseUrl = 'https://grunt.api.dotapi.gg';

const String medalsUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/medals';

const String teamsUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/teams';

const String seasonsUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/seasons';

const String mapsUrl = '$baseUrl/games/halo-infinite/metadata/multiplayer/maps';

const String manufacturerUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/manufacturers';

const String careerRanksUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/career-ranks';

const String currenciesUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/currencies';

const String weeklyRewardUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/weekly-reward';

const String categoriesUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/modes/categories';

const String engineVariantsUrl =
    '$baseUrl/games/halo-infinite/metadata/multiplayer/modes/engine-variants';

const String matchStatsUrl =
    '$baseUrl/games/halo-infinite/stats/multiplayer/matches/{matchId}';

/// type in {all, matchmaking, custom, local}
const String matchesUrl =
    '$baseUrl/games/halo-infinite/stats/multiplayer/players/{gamertag}/matches?&offset={offset}&type={type}&count={count}';

///filter in {all, ranked, social}
const matchMadeUrl =
    '$baseUrl/games/halo-infinite/stats/multiplayer/players/{gamertag}/service-record/matchmade?filter={filter}';

const csrUrl =
    '$baseUrl/games/halo-infinite/stats/multiplayer/players/{gamertag}/csrs';

const appearanceUrl =
    '$baseUrl/games/halo-infinite/appearance/players/{gamertag}/spartan-id';

const tokenVerificationUrl = '$baseUrl/tooling/api/users/me';

abstract class Network {
  static int remainingRequests = 0;
  static int maxRequests = 50;
  static DateTime retryAfter = DateTime.now();

  static Future<dynamic> get(String url, {String? token}) async {
    // try {
    //   canAccessApi();
    // } catch (e) {
    //   rethrow;
    // }
    if (canAccessApi() == false) {
      throw TooManyRequestsException(
          'Too many requests - retry after: ${DateTime.now().difference(retryAfter).inSeconds} seconds',
          retryAfter);
    }

    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: token,
      },
    );

    remainingRequests = int.parse(response.headers['ratelimit-remaining']!);
    maxRequests = int.parse(response.headers['ratelimit-limit']!);

    DateFormat dateFormat =
        DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", "en_US");
    retryAfter = dateFormat.parse(response.headers['ratelimit-reset']!);

    if (response.statusCode == 200) {
      print(
          'request: status: success - ${response.headers['ratelimit-remaining']}/${response.headers['ratelimit-limit']}');

      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw BadArgumentException(
          'Bad argument - ${jsonDecode(response.body)['message']}');
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException('Unauthorized - token used is not valid !');
    } else if (response.statusCode == 429) {
      var message = jsonDecode(response.body)['message'];

      throw TooManyRequestsException(
          'Too many requests - $message', retryAfter);
    } else {
      var message = jsonDecode(response.body)['message'];
      throw Exception(
          'request: status: failed - $message - ${response.headers['ratelimit-remaining']}/${response.headers['ratelimit-limit']}');
    }
  }

  static bool canAccessApi() {
    if (remainingRequests <= 0) {
      if (DateTime.now().isBefore(retryAfter)) {
        // throw TooManyRequestsException(
        //     'Too many requests - retry after: ${DateTime.now().difference(retryAfter).inSeconds} seconds',
        //     retryAfter);
        return false;
      }
    }
    return true;
  }
}
