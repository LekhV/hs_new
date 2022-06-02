import 'package:flutter/material.dart';

import 'background_container.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }
}
