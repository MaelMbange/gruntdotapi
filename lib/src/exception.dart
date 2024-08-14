class UnAuthorizedException implements Exception {
  final String message;

  UnAuthorizedException(
      {this.message = 'Unauthorized - Missing authentication'});

  @override
  String toString() =>
      'Unauthorized - ${message.replaceFirst('Unauthorized - ', '')}';
}

class TooManyRequestsException implements Exception {
  final String message;

  TooManyRequestsException(
      {this.message = 'TooManyRequests - Rate limit exceeded'});

  @override
  String toString() =>
      'TooManyRequests - ${message.replaceFirst('TooManyRequests - ', '')}';
}

class BadArgumentException implements Exception {
  final String message;

  BadArgumentException({this.message = 'BadArgument'});

  @override
  String toString() =>
      'BadArgument - ${message.replaceFirst('BadArgument - ', '')}';
}

class NotEnoughRequestException implements Exception {
  final String message;

  NotEnoughRequestException(
      {this.message =
          'NotEnoughRequest - Not enough request to perform Metadata request'});

  @override
  String toString() =>
      'NotEnoughRequest - ${message.replaceFirst('NotEnoughRequest - ', '')}';
}

class KeyValidityException implements Exception {
  final String message;

  KeyValidityException(
      {this.message = 'KeyValidityError - Invalid access-token'});

  @override
  String toString() =>
      'KeyValidityError - ${message.replaceFirst('KeyValidityError - ', '')}';
}

class UnImplementedException implements Exception {
  final String message;

  UnImplementedException({this.message = 'UnImplemented'});

  @override
  String toString() =>
      'UnImplemented - ${message.replaceFirst('UnImplemented - ', '')}';
}

class ServerErrorException implements Exception {
  final String message;

  ServerErrorException({this.message = 'ServerError'});

  @override
  String toString() =>
      'ServerError - ${message.replaceFirst('ServerError - ', '')}';
}
