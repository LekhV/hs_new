import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

const _colorTheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.white,
  onPrimary: AppColors.white,
  secondary: AppColors.lightBlueAccent,
  onSecondary: AppColors.black,
  error: AppColors.white,
  onError: AppColors.white,
  background: AppColors.blueAccent,
  onBackground: AppColors.black,
  surface: AppColors.white,
  onSurface: AppColors.white,
  primaryVariant: AppColors.white,
  secondaryVariant: AppColors.black,
);

// Color _getCheckboxCheckedColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return AppColors.black;
//   }
//   return Colors.grey;
// }

// Color _getCheckboxFillColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return AppColors.green;
//   }
//   return AppColors.greenDark;
// }

// Color _getSwitchTrackColor(Set<MaterialState> states) {
//   if (states.contains(MaterialState.disabled)) {
//     return Colors.grey;
//   } else if (states.contains(MaterialState.selected)) {
//     return AppColors.black;
//   }
//   return AppColors.greenDark;
// }

// Color _getSwitchThumbColor(Set<MaterialState> states) {
//   if (states.contains(MaterialState.disabled)) {
//     return Colors.grey;
//   } else if (states.contains(MaterialState.selected)) {
//     return AppColors.green;
//   }

//   return AppColors.green;
// }

// Color _getRadioFillColor(Set<MaterialState> states) {
//   if (!states.contains(MaterialState.disabled)) {
//     return AppColors.black;
//   }
//   return Colors.grey;
// }

BorderSide _getOutlinedColor(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return const BorderSide(color: AppColors.white);
  }
  return const BorderSide(color: AppColors.black);
}

ThemeData getLightTheme(BuildContext context) {
  final textTheme = Typography.material2018(platform: defaultTargetPlatform).black;

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
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    ),
  ).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.white,
        padding: textButtonScaledPadding,
      ).copyWith(
          // side: MaterialStateProperty.resolveWith(_getOutlinedColor),
          ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.white,
        onPrimary: AppColors.white,
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
        ),
      ).copyWith(
        side: MaterialStateProperty.resolveWith(_getOutlinedColor),
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.blueAccent,
    ),

    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.blueAccent),
    popupMenuTheme: const PopupMenuThemeData(color: AppColors.blueAccent),
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
        color: AppColors.white,
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
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
