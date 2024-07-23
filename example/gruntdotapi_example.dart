import 'dart:async';
import 'dart:convert';

import 'package:gruntdotapi/gruntdotapi.dart' as gruntdotapi;
import 'package:gruntdotapi/config.dart';
import 'package:gruntdotapi/src/statistics/components/mode.dart';

void main() async {
  // test1();
  // test2();
  test3();
}

//{
//    "id": 3233952928,
//    "name": "Killjoy",
//    "description": "End an enemy's killing spree",
//    "image_urls": {
//      "small": "https://etxvqmdrjezgtwgueiar.supabase.co/storage/v1/render/image/public/assets/games/halo-infinite/metadata/multiplayer/medals/3233952928.png?width=72&height=72",
//      "medium": "https://etxvqmdrjezgtwgueiar.supabase.co/storage/v1/render/image/public/assets/games/halo-infinite/metadata/multiplayer/medals/3233952928.png?width=128&height=128",
//      "large": "https://etxvqmdrjezgtwgueiar.supabase.co/storage/v1/object/public/assets/games/halo-infinite/metadata/multiplayer/medals/3233952928.png"
//    },
//    "attributes": {
//      "difficulty": "normal"
//    },
//    "properties": {
//      "type": "spree"
//    }
// }

//Loading the metadata of the medals
Future<void> test1() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);
  if (!await accessToken.checkToken()) {
    print('Token is invalid');
    return;
  }
  print('Token is valid');

  gruntdotapi.Metadata metadata = gruntdotapi.Metadata();

  metadata.loadMedals(accessToken.token).then((value) {
    print(jsonEncode(metadata.medals[0].toJson()));
  });
}

// {
//   "stronghold_captures": 0,
//   "stronghold_defensive_kills": 0,
//   "stronghold_occupation_time": {
//     "seconds": 13,
//     "human": "00h 00m 13s"
//   },
//   "stronghold_offensive_kills": 0,
//   "stronghold_scoring_ticks": 5,
//   "stronghold_secures": 0,
//   "assists": 2,
//   "deaths": 12,
//   "kda": -2.33,
//   "kills": 9
// }

//Loading the metadata of macthes
Future<void> test2() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);
  // if (!await accessToken.checkToken()) {
  //   print('Token is invalid');
  //   return;
  // }
  print('Token is valid');

  gruntdotapi.Statistics statistics = gruntdotapi.Statistics();

  await statistics.loadMatches(accessToken.token, 'icecurim',
      count: 1, offset: 0);

  print(jsonEncode(statistics.matches[0].player.stats.mode?.toJson()));
}

Future<void> test3() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);
  // if (!await accessToken.checkToken()) {
  //   print('Token is invalid');
  //   return;
  // }
  // print('Token is valid');

  gruntdotapi.Statistics statistics = gruntdotapi.Statistics();

  await statistics
      .loadMatchMade(accessToken.token, 'icecurim', filter: 'ranked')
      .then((value) => print(jsonEncode(value.toJson())));
}
