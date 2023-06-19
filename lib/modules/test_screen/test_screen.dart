import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/camera_view.dart';
import 'controller/test_controller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Test Screen'),
          actions: [
            TextButton(
              onPressed: controller.onMatchGesture,
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: CameraView(
                initialDirection: CameraLensDirection.back,
                onPredictionReceived: (String label, double confidence) {
                  controller.predictionAnalyze(label, confidence);
                  // print('Label: $label, Confidence: $confidence');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildHandSignDisplay(controller.currentHandSign
                  .value), // Add the hand sign display widget here
            ),
            // Expanded(
            //   flex: 1,
            //   child: _buildScoreDisplay(
            //       controller.score.value), // Add the score display widget here
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ElevatedButton(
            //     onPressed: controller.onMatchGesture,
            //     child: const Text('Match Gesture'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _buildCameraStream(CameraController cameraController) {
  //   if (!cameraController.value.isInitialized) {
  //     return Container(
  //       color: Colors.grey, // Placeholder color
  //     );
  //   }
  //   return CameraPreview(cameraController);
  // }

  Widget _buildHandSignDisplay(String currentHandSign) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<TestController>(
          builder: (controller) {
            return Text(
              'Level ${controller.currentLevel}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Current Hand Sign:',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 12),
        GetBuilder<TestController>(
          builder: (controller) {
            return Image.asset(
              'assets/images/${controller.currentLevel}.png',
              scale: 25.0,
            );
          },
        ),
      ],
    );
  }

  // Widget _buildScoreDisplay(int score) {
  //   return Center(
  //     child: Text(
  //       'Score: $score',
  //       style: const TextStyle(fontSize: 24),
  //     ),
  //   );
  // }
}
