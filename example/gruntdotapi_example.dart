import 'dart:async';
import 'dart:convert';

import 'package:gruntdotapi/gruntdotapi.dart' as gruntdotapi;
import 'package:gruntdotapi/config.dart';

void main() async {
  // test1();
  // test2();
  // test3();
  // test4();
  test5();
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

//Loading the metadata of matches
Future<void> test2() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

  List<gruntdotapi.Match> matches =
      await gruntdotapi.Statistics.loadMatches(accessToken.token, 'icecurim');

  // matches.sort((a, b) => b.startedAt.compareTo(a.startedAt));
  matches.sort();
  for (var element in matches) {
    print(
        '${element.details.ugcGameVariant.name.toString().padRight(25)} : ${element.details.playlist.ranked.toString().padRight(5)} : ${element.startedAt.day}/${element.startedAt.month}/${element.startedAt.year} - ${element.startedAt.hour.toString().padLeft(2, '0')}h${element.startedAt.minute.toString().padLeft(2, '0')}');
  }
}

Future<void> test3() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

  await gruntdotapi.Statistics.loadGlobalStatistics(
          accessToken.token, 'icecurim',
          filter: 'ranked')
      .then((value) => print(jsonEncode(value.toJson())));
}

Future<void> test4() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

  await gruntdotapi.Statistics.loadCSRS(accessToken.token, 'icecurim')
      .then((value) => value.forEach(print));
}

Future<void> test5() async {
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

  await gruntdotapi.Statistics.loadAppearance(accessToken.token, 'icecurim')
      .then(print);
}
