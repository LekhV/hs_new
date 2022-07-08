import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../domain/common/exceptions.dart';

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

    if (exception is NetworkException) {
      return sorrySomethingWrong;
    }

    if (exception is CollectionLimitExceededException) {
      return cardCollectionLimit10;
    }

    if (exception is CardsLimitExceededException) {
      return limitCardsOneType2;
    }
    if (exception is SameCardsException) {
      return collectionWithSameName;
    }

    if (exception is NoElementException) {
      return thisCardNotAddYet;
    }

    if (exception is NoCollectionException) {
      return collectionIsEmpty;
    }

    return noData;
  }
}
