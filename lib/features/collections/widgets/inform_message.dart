import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

class InformMessageWidget extends StatelessWidget {
  final String text;
  const InformMessageWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.white),
    );
  }
}
