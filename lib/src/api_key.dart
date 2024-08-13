import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;

class ApiKey {
  String _accessToken = '';
  int _ratelimit = 0;
  bool _isvalid = false;
  String _userID = '';

  int _ratelimitRemaining = 0;
  DateTime _retryAfter = DateTime.utc(1970);

  Future<void> setupAccessToken(String authenticationKey) async {
    _accessToken = authenticationKey;
    await _askTokenValidity();
  }

  String get accessToken => _accessToken;
  String get userID => _userID;
  int get ratelimit => _ratelimit;
  int get ratelimitRemaining => _ratelimitRemaining;
  bool get isValid => _isvalid && _ratelimitRemaining > 0 && _userID.isNotEmpty;

  DateTime get retryAfter => _retryAfter;
  Duration get timeBeforeReset => _retryAfter.difference(DateTime.now());

  void updateRetryAfter({required DateTime retryAfter}) =>
      _retryAfter = retryAfter;
  void updateRatelimitRemaining({required int remaining}) =>
      _ratelimitRemaining = remaining;
  void updateRatelimit({required int ratelimit}) => _ratelimit = ratelimit;

  Future<void> _askTokenValidity() async {
    http.Response response = await Gruntdotapi.request(
        route: Routes.toolingToken, authenticationKey: this);

    if (response.statusCode == 200) {
      _isvalid = true;

      //=> will retrieve the data and due to request implementation automatically update retryAfter, ratelimit and ratelimitRemaining
      response = await Gruntdotapi.request(
          route: Routes.toolingUserInfo, authenticationKey: this);

      _userID = await Gruntdotapi.fetchResponse(
          response: response, fromJson: (e) => e['id']);
    } else {
      _accessToken = '';
      _isvalid = false;
      _userID = '';
      _retryAfter = DateTime.utc(1970);
      _ratelimit = 0;
      _ratelimitRemaining = 0;

      throw KeyValidityException();
    }
  }
}
