import 'dart:async';
import 'dart:convert';

import 'package:gruntdotapi/gruntdotapi.dart' as gruntdotapi;
import 'package:gruntdotapi/config.dart';

void main() async {
  test0();
  // test1();
  // test2();
  // test3();
  // test4();
  // test5();
}

Future<void> test0() async {
  try {
    print('test->0');
    gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

    await gruntdotapi.Metadata.loadAll(accessToken.token).then((_) {
      print(gruntdotapi.Metadata.isLoaded());
    });
  } catch (e) {
    print(e);
  }
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
  print('test->1');
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);
  // if (!await accessToken.checkToken()) {
  //   print('Token is invalid');
  //   return;
  // }
  // print('Token is valid');

  try {
    await gruntdotapi.Metadata.loadMedals(token: accessToken.token).then((_) {
      print(jsonEncode(gruntdotapi.Metadata.medals[0].toJson()));
    });
  } catch (e) {
    print(e);
  }
}

//Loading the metadata of matches
Future<void> test2() async {
  print('test->2');
  gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

  try {
    List<gruntdotapi.Match> matches = await gruntdotapi.Statistics.loadMatches(
        token: accessToken.token, gamertag: 'icecurim');
    // matches.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    matches.sort();
    for (var element in matches) {
      print(
          '${element.details.ugcGameVariant.name.toString().padRight(25)} : ${element.details.playlist.ranked.toString().padRight(5)} : ${element.startedAt.day}/${element.startedAt.month}/${element.startedAt.year} - ${element.startedAt.hour.toString().padLeft(2, '0')}h${element.startedAt.minute.toString().padLeft(2, '0')}');
    }
  } catch (e) {
    print(e);
    return;
  }
}

Future<void> test3() async {
  print('test->3');
  try {
    gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

    await gruntdotapi.Statistics.loadGlobalStatistics(
            token: accessToken.token, gamertag: 'icecurim', filter: 'ranked')
        .then((value) => print(jsonEncode(value.toJson())));
  } catch (e) {
    print(e);
  }
}

Future<void> test4() async {
  print('test->4');
  try {
    gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

    await gruntdotapi.Statistics.loadCSRS(
            token: accessToken.token, gamertag: 'icecurim')
        .then((value) => value.forEach(print));
  } catch (e) {
    print(e);
  }
}

Future<void> test5() async {
  print('test->5');
  try {
    gruntdotapi.ApiKey accessToken = gruntdotapi.ApiKey(token: token);

    await gruntdotapi.Statistics.loadAppearance(
            token: accessToken.token, gamertag: 'icecurim')
        .then(print);
  } catch (e) {
    print(e);
  }
}
