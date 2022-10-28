import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final String text;
  const CostWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          Image.asset('assets/cost.png', width: 40, height: 40, fit: BoxFit.fill),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
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
