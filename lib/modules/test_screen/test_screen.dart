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
            Obx(() {
              if (controller.currentLevel < 6) {
                return TextButton(
                  onPressed: controller.skipLevel,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
        body: Obx(() {
          if (controller.currentLevel < 6) {
            return Column(
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
            );
          } else {
            return _buildScoreDisplay(
                controller.score.value); // Add the score display widget here
          }
        }),
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

  Widget _buildScoreDisplay(int score) {
    return GetBuilder<TestController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/1.png',
                width: 50.0,
              ),
              Text('Done'),
              if (controller.passedlevels.contains('Done'))
                Icon(Icons.check)
              else
                Icon(Icons.close),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/2.png',
                width: 50.0,
              ),
              Text('Fist'),
              if (controller.passedlevels.contains('Fist'))
                Icon(Icons.check)
              else
                Icon(Icons.close),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/3.png',
                width: 50.0,
              ),
              Text('Five'),
              if (controller.passedlevels.contains('Five'))
                Icon(Icons.check)
              else
                Icon(Icons.close),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/4.png',
                width: 50.0,
              ),
              Text('Four'),
              if (controller.passedlevels.contains('Four'))
                Icon(Icons.check)
              else
                Icon(Icons.close),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/5.png',
                width: 50.0,
              ),
              Text('Three'),
              if (controller.passedlevels.contains('Three'))
                Icon(Icons.check)
              else
                Icon(Icons.close),
            ],
          ),
        ],
      );
    });
  }
}
