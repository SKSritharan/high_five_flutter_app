import 'package:get/get.dart';

class TestController extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt score = 0.obs;
  RxString currentHandSign = ''.obs;

  List<String> levels = ['Done', 'Fist', 'Five', 'Four', 'Three', 'Two', 'One'];
  RxList passedlevels = [].obs;

  void predictionAnalyze(String label, double confidence) {
    currentHandSign.value = levels[currentLevel.value];
    if (currentHandSign.value == label) {
      passedlevels.add(currentHandSign.value);
      score.value += 20;
      currentLevel.value++;
      update();
    } else {
      print("Try Again");
      print("currentHandSign.value = " + currentHandSign.value);
    }
  }

  void skipLevel() {
    currentLevel.value++;
    update(); // Notify listeners that the values have changed
  }
}
