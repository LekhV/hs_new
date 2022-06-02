import 'package:flutter/material.dart';
import 'package:flutter_hs/utils/localizations_extension.dart';

class DetailsButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;

  const DetailsButton({
    this.text,
    required this.onTap,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        text ?? context.localizations!.seeDetails,
      ),
      onPressed: onTap,
      // style: OutlinedButton.styleFrom(
      //   padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      //   side: const BorderSide(
      //     //  color: Colors.white,
      //     width: 1,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30.0),
      //   ),
      //   textStyle: const TextStyle(
      //     fontSize: 12,
      //   ),
      // ),
    );
  }
}
