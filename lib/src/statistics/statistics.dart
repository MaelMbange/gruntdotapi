import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:gruntdotapi/src/network.dart' as net;

class Statistics {
  List<Match> matches = [];

  void resetList() => matches = [];

  Future<Statistics> loadMatches(String token, String gamertag,
      {String type = 'matchmaking', int offset = 0, int count = 25}) async {
    var response = await net.get(
        net.matchesUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', type)
            .replaceAll('{offset}', offset.toString())
            .replaceAll('{count}', count.toString()),
        token: token);

    matches.insertAll(
        0,
        (response['data'] as List)
            .map<Match>((e) => Match.fromJson(e))
            .toList());

    return this;
  }

  Future<bool> loadMoreMatches(String token, String gamertag) async {
    var response = await net.get(
        net.matchesUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', 'matchmaking')
            .replaceAll('{offset}', matches.length.toString())
            .replaceAll('{count}', '25'),
        token: token);

    final initLenght = matches.length;

    matches.addAll((response['data'] as List)
        .map<Match>((e) => Match.fromJson(e))
        .toList());

    if (matches.length == initLenght) return false;

    return true;
  }

  Future<Statistics> reloadMatches(String token, String gamertag) async {
    var response = await net.get(
        net.matchesUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{type}', 'matchmaking')
            .replaceAll('{offset}', matches.length.toString())
            .replaceAll('{count}', '25'),
        token: token);

    List<Match> newMatches = (response['data'] as List)
        .map<Match>((e) => Match.fromJson(e))
        .toList();

    Set<Match> s1 = Set<Match>.from(matches);
    Set<Match> s2 = Set<Match>.from(newMatches);
    Set<Match> s3 = s2.difference(s1);

    matches.insertAll(0, s3.toList());
    return this;
  }

  Future<MatchMade> loadMatchMade(String token, String gamertag,
      {String filter = 'all'}) async {
    var response = await net.get(
        net.matchMadeUrl
            .replaceAll('{gamertag}', gamertag)
            .replaceAll('{filter}', filter),
        token: token);

    return MatchMade.fromJson(response['data']);
  }
}
