import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

import '../../../infrastructure/theme/app_colors.dart';

class CollectionErrorWidget extends StatelessWidget {
  const CollectionErrorWidget({Key? key, this.textError}) : super(key: key);
  final String? textError;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          textError ?? context.localizations!.noData,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
