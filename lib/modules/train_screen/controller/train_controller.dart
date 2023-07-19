import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/custom_snackbar.dart';

class TrainController extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt score = 0.obs;
  RxString currentHandSign = ''.obs;
  RxDouble predConfidence = 0.0.obs;

  List<String> levels = ['Five', 'One', 'Two', 'Done', 'Rad'];
  RxList passedlevels = [].obs;

  late ConfettiController controllerCenter;

  @override
  void onInit() {
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
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
    if (currentHandSign.value == label && predConfidence.value > 0.9) {
      passedlevels.add(currentHandSign.value);
      score.value += 20;
      if (currentLevel.value == 6) {
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
}
