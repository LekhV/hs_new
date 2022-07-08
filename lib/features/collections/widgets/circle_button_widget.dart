import 'package:flutter/material.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

class CircleButtonWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onTap;

  final bool isLoad;

  const CircleButtonWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onTap,
    this.isLoad = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                color: AppColors.white,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            width: 42,
            height: 42,
            child: isLoad
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).backgroundColor,
                    ),
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}