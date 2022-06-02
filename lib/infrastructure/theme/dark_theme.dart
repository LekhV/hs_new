import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

const _colorTheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.white,
  onPrimary: AppColors.brown,
  secondary: AppColors.orange,
  onSecondary: AppColors.brown,
  error: AppColors.orange,
  onError: AppColors.orange,
  background: AppColors.brown,
  onBackground: AppColors.brown,
  surface: AppColors.orange,
  onSurface: AppColors.white,
  primaryVariant: AppColors.orange,
  secondaryVariant: AppColors.brown,
);

// Color _getCheckboxCheckedColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return AppColors.black;
//   }
//   return AppColors.black;
// }

// Color _getCheckboxFillColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return Colors.white;
//   }
//   return Colors.grey;
// }

// Color _getSwitchTrackColor(Set<MaterialState> states) {
//   if (states.contains(MaterialState.disabled)) {
//     return AppColors.orange;
//   } else if (states.contains(MaterialState.selected)) {
//     return AppColors.orange;
//   }

//   return Colors.white;
// }

// Color _getSwitchThumbColor(Set<MaterialState> states) {
//   if (states.contains(MaterialState.disabled)) {
//     return AppColors.greenDark;
//   } else if (states.contains(MaterialState.selected)) {
//     return AppColors.greenDark;
//   }

//   return AppColors.green;
// }

// Color _getRadioFillColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return AppColors.green;
//   }
//   return AppColors.greenDark;
// }

BorderSide _getOutlinedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return const BorderSide(color: Colors.white);
  }
  return const BorderSide(color: Colors.grey);
}

ThemeData getDarkTheme(BuildContext context) {
  final textTheme = Typography.material2018(platform: defaultTargetPlatform).white;

  final buttonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  final textButtonScaledPadding = ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
  );

  return ThemeData.from(
    colorScheme: _colorTheme,
    textTheme: textTheme.apply(
      fontFamily: 'Open Sans',
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decorationColor: AppColors.black,
    ),
  ).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: textButtonScaledPadding,
      ).copyWith(
          //side: MaterialStateProperty.resolveWith(_getOutlinedColor),
          ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.black,
        onPrimary: AppColors.orange,
        padding: buttonScaledPadding,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        side: const BorderSide(
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.white,
        ),
      ).copyWith(
        side: MaterialStateProperty.resolveWith(_getOutlinedColor),
      ),
    ),

    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.black,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.brown),
    popupMenuTheme: const PopupMenuThemeData(color: AppColors.brown),
    snackBarTheme: const SnackBarThemeData(backgroundColor: AppColors.black),

    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.resolveWith((_getCheckboxFillColor)),
    //   checkColor: MaterialStateProperty.resolveWith(_getCheckboxCheckedColor),
    // ),
    // switchTheme: SwitchThemeData(
    //   trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColor),
    //   thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColor),
    // ),
    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.resolveWith(_getRadioFillColor),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(20.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
