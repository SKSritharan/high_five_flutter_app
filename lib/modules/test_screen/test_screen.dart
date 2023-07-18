import 'dart:math';

import 'package:camera/camera.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five_flutter_app/utils/widgets/banana_meter.dart';

import '../../routes/app_routes.dart';
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
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:
                      _buildHandSignDisplay(controller.currentHandSign.value),
                ),
                BananaMeter(controller.predConfidence.value),
              ],
            );
          } else {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: controller.controllerCenter,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: true,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ],
                    createParticlePath: drawStar,
                  ),
                ),
                _buildScoreDisplay(controller.score.value)
              ],
            );
          }
        }),
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Widget _buildHandSignDisplay(String currentHandSign) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<TestController>(
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Level ${controller.currentLevel}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Score ${controller.score}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  '${controller.countdownSeconds}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Current Hand Sign:',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
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
            child: Column(
              children: [
                Text(
                  'Score: $score',
                  style: const TextStyle(fontSize: 24),
                ),
                score < 100
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.sentiment_very_dissatisfied,
                            size: 50,
                          ),
                          const Text(
                            'You only predicted few, you need a training!',
                            style: TextStyle(
                                fontSize: 20, color: Colors.redAccent),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAndToNamed(AppRoutes.trainScreen);
                            },
                            child: const Text(
                              "Get Train Now!",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/1.png',
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
                'assets/images/2.png',
                width: 50.0,
              ),
              Text('One'),
              if (controller.passedlevels.contains('One'))
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
              Text('Two'),
              if (controller.passedlevels.contains('Two'))
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
                'assets/images/5.png',
                width: 50.0,
              ),
              Text('Rad'),
              if (controller.passedlevels.contains('Rad'))
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
