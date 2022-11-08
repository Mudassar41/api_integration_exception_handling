class AppException implements Exception {
  final String? message;

  AppException(this.message);

  @override
  String toString() {
    // TODO: implement toString
    return message.toString();
  }
}

class BadRequestException extends AppException {
  BadRequestException(super.message);
}

class FetchDataException extends AppException {
  FetchDataException(super.message);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(super.message);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(super.message);
}
