import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt score = 0.obs;
  RxString currentHandSign = ''.obs;

  List<String> levels = ['Done', 'Fist', 'Five', 'Four', 'Three', 'Two', 'One'];
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
    currentHandSign.value = levels[currentLevel.value];
    if (currentHandSign.value == label) {
      passedlevels.add(currentHandSign.value);
      score.value += 20;
      currentLevel.value++;
      if (currentLevel.value == 6) {
        controllerCenter.play();
      }
      update();
    } else {
      print("Try Again");
      print("currentHandSign.value = " + currentHandSign.value);
    }
  }

  void skipLevel() {
    currentLevel.value++;
    if (currentLevel.value == 6) {
      controllerCenter.play();
    }
    update();
  }
}
