abstract class AppException implements Exception {}

class NetworkException implements AppException {
  const NetworkException();
}

class InvalidSignUpException implements AppException {
  const InvalidSignUpException();
}

class InvalidSignInException implements AppException {
  const InvalidSignInException();
}

class UserNotFoundException implements AppException {
  const UserNotFoundException();
}

class InvalidPasswordException implements AppException {
  const InvalidPasswordException();
}

class WeakPasswordException implements AppException {
  const WeakPasswordException();
}

class EmailAlreadyUseException implements AppException {
  const EmailAlreadyUseException();
}

class InvalidLogOutException implements AppException {
  const InvalidLogOutException();
}
