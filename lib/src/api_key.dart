import 'package:gruntdotapi/gruntdotapi.dart';
import 'network.dart';

class ApiKey {
  String token = '';
  bool _isValid = false;
  bool get isValid => _isValid;

  ApiKey({this.token = ''});

  dynamic setToken(String token) {
    this.token = token;
    return this;
  }

  String getToken() {
    return token;
  }

  Future<bool> checkToken() async {
    try {
      await Network.get(tokenVerificationUrl, token: token);
      _isValid = true;
    } on UnAuthorizedException {
      _isValid = false;
    }
    return _isValid;
  }
}
