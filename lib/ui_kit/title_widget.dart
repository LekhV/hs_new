import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 14.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              'Tap $title',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.2),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
