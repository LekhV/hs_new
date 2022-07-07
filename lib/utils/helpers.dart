import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

InputDecoration buildInputDecoration({
  required String label,
  bool withError = false,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: withError ? AppColors.red : AppColors.white,
      height: 0.9,
      fontSize: 15,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: withError ? AppColors.red : AppColors.white,
      ),
    ),
    contentPadding: const EdgeInsetsDirectional.only(
      bottom: 12,
      start: 10,
      end: 10,
    ),
    suffixIcon: suffixIcon,
  );
}

bool validateEmail(String email) => EmailValidator.validate(email);
