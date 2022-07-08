abstract class AppException implements Exception {}

class NetworkException implements AppException {
  const NetworkException();
}

class CollectionLimitExceededException implements AppException {
  const CollectionLimitExceededException();
}

class CardsLimitExceededException implements AppException {
  const CardsLimitExceededException();
}

class SameCardsException implements AppException {
  const SameCardsException();
}

class NoElementException implements AppException {
  const NoElementException();
}

class NoCollectionException implements AppException {
  const NoCollectionException();
}
