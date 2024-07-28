class UnAuthorizedException implements Exception {
  final String message;

  UnAuthorizedException(this.message);

  @override
  String toString() => message;
}

class TooManyRequestsException implements Exception {
  final String message;
  final DateTime retryAfter;

  TooManyRequestsException(this.message, this.retryAfter);

  @override
  String toString() => message;
}

class BadArgumentException implements Exception {
  final String message;

  BadArgumentException(this.message);

  @override
  String toString() => message;
}
