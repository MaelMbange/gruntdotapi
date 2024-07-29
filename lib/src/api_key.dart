import 'package:gruntdotapi/gruntdotapi.dart';

class ApiKey {
  String _token;
  bool _isValid;

  ApiKey({String accessToken = ''})
      : _token = accessToken,
        _isValid = false;

  Future<void> updateToken(String token) async {
    _token = token;
    _isValid = false;
    await isTokenValid();
  }

  String get token => _token;

  bool get isValid => _isValid;

  Future<bool> isTokenValid() async {
    if (_isValid == true) return _isValid;
    try {
      if (_token.isNotEmpty) {
        await Network.get(tokenVerificationUrl, token: token);
        _isValid = true;
      }
      print('token is valid');
    } on UnAuthorizedException {
      _isValid = false;
    } catch (e) {
      _isValid = false;
      rethrow;
    }
    return _isValid;
  }
}
