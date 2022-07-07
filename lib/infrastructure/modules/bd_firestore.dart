import 'package:flutter_hs/data/bd_firestore_repository/bd_firestore_repository_impl.dart';
import 'package:flutter_hs/domain/bd_firestore/bd_firestore_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BDFirestoreModule {
  @lazySingleton
  BDFirestoreRepository getBDFirestoreRepository() {
    return BDFirestoreRepositoryImpl();
  }
}
