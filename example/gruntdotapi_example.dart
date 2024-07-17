import 'dart:async';

import 'package:gruntdotapi/gruntdotapi.dart' as gruntdotapi;
import 'package:gruntdotapi/config.dart';

void main() async {
  gruntdotapi.Statistics statistics =
      gruntdotapi.Statistics(token: token, gamertag: 'icecurim');

  await statistics.loadMatches();
  print(statistics.matches.length);
}

Future<void> test1() async {
  gruntdotapi.Metadata metadata = gruntdotapi.Metadata(token: token);

  try {
    await metadata.load();

    print(metadata.medals);
    print(metadata.maps);
    print(metadata.engineVariants);
  } catch (e) {
    print(e);
  }
}
