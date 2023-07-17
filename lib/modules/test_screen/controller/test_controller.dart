import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/custom_snackbar.dart';

class TestController extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt score = 0.obs;
  RxString currentHandSign = ''.obs;
  RxDouble predConfidence = 0.0.obs;

  RxInt countdownSeconds = 30.obs;
  late Timer countdownTimer;

  List<String> levels = ['Five', 'One', 'Two', 'Done', 'Rad'];
  RxList passedlevels = [].obs;

  late ConfettiController controllerCenter;

  @override
  void onInit() {
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    startPredictionCountdown();
    super.onInit();
  }

  @override
  void onClose() {
    controllerCenter.dispose();
    super.onClose();
  }

  void predictionAnalyze(String label, double confidence) {
    currentHandSign.value = levels[(currentLevel.value) - 1];
    predConfidence.value = confidence;
    if (currentHandSign.value == label) {
      stopPredictionCountdown();
      showCustomSnackbar(
        'You have passed level ${currentLevel.value}',
        SnackType.success,
      );
      passedlevels.add(currentHandSign.value);
      score.value += 20;
      currentLevel.value++;
      startPredictionCountdown();
      if (currentLevel.value == 6) {
        stopPredictionCountdown();
        controllerCenter.play();
      }
      update();
    }
  }

  void skipLevel() {
    showCustomSnackbar(
      'You skipped level ${currentLevel.value}',
      SnackType.info,
    );
    currentLevel.value++;
    if (currentLevel.value == 6) {
      controllerCenter.play();
    }
    update();
  }

  void startPredictionCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownSeconds.value > 0) {
        countdownSeconds.value--;
      } else {
        stopPredictionCountdown();
        currentLevel.value++;
        startPredictionCountdown();
      }
    });
  }

  void stopPredictionCountdown() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
    countdownSeconds.value = 30;
  }
}
