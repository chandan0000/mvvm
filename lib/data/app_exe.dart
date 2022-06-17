class AppExeception implements Exception {
  final _message;
  final _prefix;
  AppExeception([this._message, this._prefix]);
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExeception extends AppExeception {
  FetchDataExeception([String? message])
      : super(message, "error during Communication");
}

class BadRequestExeception extends AppExeception {
  BadRequestExeception([String? message]) : super(message, "Invalid request");
}

class UnauthorisedExeception extends AppExeception {
  UnauthorisedExeception([String? message])
      : super(message, "Unauthorised request");
}

class InvalidInputExeception extends AppExeception {
  InvalidInputExeception([String? message])
      : super(message, "InvalidInput request");
}
