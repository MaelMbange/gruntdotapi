import 'dart:async';

import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:gruntdotapi/config.dart';

void main() async {
  test01();
  // test0();
  // test1();
  // test2();
  // test3();
  // test4();
  // test5();
}

Future<void> test01() async {
  print('test 01 - Start');
  ApiKey accessToken = ApiKey();
  try {
    await accessToken.setupAccessToken(token);
    if (accessToken.isValid) {
      print('User id: ${accessToken.userID}');
      print(
          'Remaining ratelimit: ${accessToken.ratelimitRemaining}/${accessToken.ratelimit}');
      print('Token Valid: ${accessToken.isValid}');
      print('Retry after: ${accessToken.retryAfter}');
      print('Time before reset: ${accessToken.timeBeforeReset.inSeconds}s');
    } else {
      print('Not valid');
    }
  } catch (e) {
    print(e);

    print('Token Valid: ${accessToken.isValid}');
    print('User id: ${accessToken.userID}');
    print(
        'Remaining ratelimit: ${accessToken.ratelimitRemaining}/${accessToken.ratelimit}');
    print('Retry after: ${accessToken.retryAfter}');
    print('Time before reset: ${accessToken.timeBeforeReset.inSeconds}s');
    print('test 01 - End');
  }
}

Future<void> test0() async {
  try {
    print('test 0 - Start');
    ApiKey accessToken = ApiKey();
    await accessToken.setupAccessToken(token);
    if (accessToken.isValid) {
      await Metadata.loadAll(authenticationKey: accessToken).then((_) {
        print(Metadata.isAllDataLoaded());
      });
    }
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
  ApiKey accessToken = ApiKey();
  await accessToken.setupAccessToken(token);

  try {
    if (accessToken.isValid) {
      await Metadata.loadMedals(authenticationKey: accessToken).then((_) {
        print(Metadata.medals[0]);
      });
    }
  } catch (e) {
    print(e);
  }
}

// //Loading the metadata of matches
Future<void> test2() async {
  print('test->2');
  ApiKey accessToken = ApiKey();
  await accessToken.setupAccessToken(token);

  try {
    if (accessToken.isValid) {
      List<Match> matches = await Statistics.loadMatches(
          authenticationKey: accessToken, gamertag: 'icecurim');

      matches.sort();
      Match element = matches.first;
      print(
          '${element.details.ugcGameVariant.name.toString().padRight(25)} : ${element.details.playlist.ranked.toString().padRight(5)} : ${element.startedAt.day}/${element.startedAt.month}/${element.startedAt.year} - ${element.startedAt.hour.toString().padLeft(2, '0')}h${element.startedAt.minute.toString().padLeft(2, '0')}');
    }
  } catch (e) {
    print(e.toString());
    return;
  }
}

Future<void> test3() async {
  print('test->3');
  try {
    ApiKey accessToken = ApiKey();
    await accessToken.setupAccessToken(token);

    if (accessToken.isValid) {
      await Statistics.loadGlobalStatistics(
              authenticationKey: accessToken,
              gamertag: 'icecurim',
              filter: 'ranked')
          .then((value) => print(value));
    }
  } catch (e) {
    print(e);
  }
}

Future<void> test4() async {
  print('test->4');
  try {
    ApiKey accessToken = ApiKey();
    await accessToken.setupAccessToken(token);

    if (accessToken.isValid) {
      await Statistics.loadCSRS(
              authenticationKey: accessToken, gamertag: 'icecurim')
          .then((value) => value.forEach(print));
    }
  } catch (e) {
    print(e);
  }
}

Future<void> test5() async {
  print('test->5');
  try {
    ApiKey accessToken = ApiKey();
    await accessToken.setupAccessToken(token);

    if (accessToken.isValid) {
      await Statistics.loadAppearance(
              authenticationKey: accessToken, gamertag: 'icecurim')
          .then(print);
    }
  } catch (e) {
    print(e);
  }
}
