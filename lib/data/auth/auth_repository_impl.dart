import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hs/domain/auth/auth_repository.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';
import 'package:flutter_hs/utils/persist_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final auth = FirebaseAuth.instance;

  AuthRepositoryImpl();

  @override
  Future<UserCredential> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty || password.length < 4) {
      throw const InvalidSignInException();
    }

    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      persistStorage.setStringForKey(
        USER_TOKEN,
        credential.user?.uid ?? '',
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw const InvalidPasswordException();
      }
      throw const InvalidSignInException();
    }
  }

  @override
  Future<UserCredential> createUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty || password.length < 4) {
      throw const InvalidSignUpException();
    }
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      persistStorage.setStringForKey(
        USER_TOKEN,
        credential.user?.uid ?? '',
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw const EmailAlreadyUseException();
      }
      throw const InvalidSignUpException();
    }
  }

  @override
  Future<void> logout() {
    try {
      persistStorage.setStringForKey(USER_TOKEN, '');
      persistStorage.setStringForKey(PREFERENCES_CARDBACK, '');

      return auth.signOut();
    } catch (e) {
      throw const InvalidLogOutException();
    }
  }
}
