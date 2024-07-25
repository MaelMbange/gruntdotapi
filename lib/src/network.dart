library network;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
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

Future<dynamic> get(String url, {String? token}) async {
  var response = await http.get(
    Uri.parse(url),
    headers: {
      if (token != null) HttpHeaders.authorizationHeader: token,
    },
  );

  if (response.statusCode == 200) {
    print(
        'request: status: success - ${response.headers['ratelimit-remaining']}/${response.headers['ratelimit-limit']}');
    return jsonDecode(response.body);
  } else if (response.statusCode == 401) {
    throw UnAuthorizedException('Unauthorized - token used is not valid !');
  } else if (response.statusCode == 429) {
    var message = jsonDecode(response.body)['message'];
    throw TooManyRequestsException('Too many requests - $message');
  } else {
    var message = jsonDecode(response.body)['message'];
    throw Exception(
        'request: status: failed - $message - ${response.headers['ratelimit-remaining']}/${response.headers['ratelimit-limit']}');
  }
}
