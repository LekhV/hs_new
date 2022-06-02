import 'package:flutter/material.dart';
import 'package:flutter_hs/config.dart';
import 'package:flutter_hs/infrastructure/theme/app_colors.dart';

class CardDetailsImage extends StatelessWidget {
  final String? image;
  const CardDetailsImage(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Align(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Image.network(
                      image ?? config.mainImgHs,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
