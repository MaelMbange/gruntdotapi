import 'dart:async';
import 'dart:convert';

import 'package:gruntdotapi/gruntdotapi.dart' as gruntdotapi;
import 'package:gruntdotapi/config.dart';

void main() async {
  test1();
}
// content of the test1 function
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

Future<void> test1() async {
  gruntdotapi.Metadata metadata = gruntdotapi.Metadata(token: token);

  try {
    await metadata.load();

    print(jsonEncode(metadata.medals[0].toJson()));
  } catch (e) {
    print(e);
  }
}

Future<void> test2() async {
  gruntdotapi.Statistics statistics =
      gruntdotapi.Statistics(token: token, gamertag: 'icecurim');

  await statistics.loadMatches();
  print(statistics.matches);
}
