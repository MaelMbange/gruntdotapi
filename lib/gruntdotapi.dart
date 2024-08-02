library gruntdotapi;

import 'dart:convert';
import 'dart:io';

import 'package:gruntdotapi/gruntdotapi.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

export 'src/article.dart';
export 'src/store/store.dart';
export 'src/metadata/export.dart';
export 'src/statistics/export.dart';
export 'src/api_key.dart';
export 'src/exception.dart';
export 'src/appearance.dart';
export 'src/routes.dart';
export 'src/statistics.dart';
export 'src/metadata.dart';

abstract class Gruntdotapi {
  static Future<http.Response> request({
    required String route,
    Map<String, dynamic>? headers,
    ApiKey? authenticationKey,
  }) async {
    http.Response response = await http.get(
      Uri.parse(route),
      headers: {
        if (authenticationKey != null) ...{
          HttpHeaders.authorizationHeader: authenticationKey.accessToken
        },
        ...?headers,
      },
    );

    if (response.headers['ratelimit-limit'] != null) {
      authenticationKey?.updateRatelimit(
          ratelimit: int.parse(response.headers['ratelimit-limit']!));
    }

    if (response.headers['ratelimit-remaining'] != null) {
      authenticationKey?.updateRatelimitRemaining(
          remaining: int.parse(response.headers['ratelimit-remaining']!));
    }

    if (response.headers['ratelimit-reset'] != null) {
      DateFormat dateFormat =
          DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", "en_US");
      authenticationKey?.updateRetryAfter(
          retryAfter: dateFormat
              .parse(response.headers['ratelimit-reset']!, true)
              .toLocal());
    }

    return response;
  }

  static R fetchResponse<R, E>({
    required http.Response response,
    required E Function(Map<String, dynamic>) fromJson,
  }) {
    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body)['data'];

      if (decodedBody is List) {
        return (decodedBody).map<E>((e) => fromJson(e)).toList() as R;
      } else {
        return fromJson(decodedBody) as R;
      }
    } else if (response.statusCode == 400) {
      throw BadArgumentException(message: response.body);
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException(message: response.body);
    } else if (response.statusCode == 429) {
      throw TooManyRequestsException(message: response.body);
    } else {
      throw UnImplementedException(message: response.body);
    }
  }
}
