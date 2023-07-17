import 'package:flutter/material.dart';

class BananaMeter extends StatelessWidget {
  final double confidence;

  const BananaMeter(this.confidence, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? progressBarColor =
        confidence >= 0.5 ? Colors.green[700] : Colors.red[700];

    return LinearProgressIndicator(
      minHeight: 15,
      value: confidence,
      backgroundColor: Colors.grey,
      color: progressBarColor,
    );
  }
}
