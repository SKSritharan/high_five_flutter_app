import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller/train_controller.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainController>(
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Train Screen'),
        ),
      )
    );
  }
}
