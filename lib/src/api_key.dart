import 'dart:convert';

import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

class ApiKey {
  String _accessToken = '';
  int _ratelimit = 0;
  bool _isvalid = false;

  int _ratelimitRemaining = 0;
  DateTime _retryAfter = DateTime.utc(1970);

  Future<void> setupAccessToken(String token) async {
    _accessToken = token;
    await _askTokenValidity();
  }

  String get accessToken => _accessToken;
  int get ratelimit => _ratelimit;
  int get ratelimitRemaining => _ratelimitRemaining;
  bool get isValid => _isvalid && _retryAfter.isBefore(DateTime.now());
  DateTime get retryAfter => _retryAfter;

  void updateRetryAfter({required DateTime retryAfter}) =>
      _retryAfter = retryAfter;
  void updateRatelimitRemaining({required int remaining}) =>
      _ratelimitRemaining = remaining;

  Future<void> _askTokenValidity() async {
    http.Response response = await Gruntdotapi.request(
        route: Routes.toolingToken, authenticationKey: this);

    if (response.statusCode == 200) {
      _isvalid = true;
      _ratelimit = jsonDecode(response.body)['data'][0]['value'];

      //=> will retrieve the data and due to request implementation automatically update the retryAfter and ratelimitRemaining
      await Gruntdotapi.request(
          route: Routes.toolingTokenRateLimitRemaining,
          authenticationKey: this);
    } else {
      _accessToken = '';
      _isvalid = false;
      throw KeyValidityException();
    }
  }
}
