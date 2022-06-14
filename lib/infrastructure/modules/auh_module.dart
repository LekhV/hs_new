import 'package:flutter_hs/data/auth/auth_repository_impl.dart';
import 'package:flutter_hs/domain/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @lazySingleton
  AuthRepository getCardBacksRepository() {
    return AuthRepositoryImpl();
  }
}
