import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hs/domain/common/exceptions.dart';

extension LocalizationsExtension on BuildContext {
  AppLocalizations? get localizations {
    return AppLocalizations.of(this);
  }

  Locale get locale {
    return Localizations.localeOf(this);
  }
}

extension AppLocalizationsX on AppLocalizations {
  String getErrorMessage(Object exception) {
    if (exception is String) {
      return exception;
    }
    if (exception is InvalidSignUpException) {
      return signUpInvalid;
    }
    if (exception is InvalidSignInException) {
      return signInInvalid;
    }
    if (exception is UserNotFoundException) {
      return noUserFound;
    }
    if (exception is InvalidPasswordException) {
      return wrongPasswordProvided;
    }
    if (exception is WeakPasswordException) {
      return thePasswordProvidedIsTooWeak;
    }
    if (exception is EmailAlreadyUseException) {
      return theAccountAlreadyExists;
    }
    if (exception is InvalidLogOutException) {
      return noData;
    }
    if (exception is NetworkException) {
      return noData;
    }
    return noData;
  }
}
