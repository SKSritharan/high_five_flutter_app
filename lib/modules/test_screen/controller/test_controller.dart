import 'package:get/get.dart';

class TestController extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt score = 0.obs;
  RxString currentHandSign = ''.obs;

  List<String> levels = ['Done', 'Fist', 'Five', 'Four', 'Three', 'Two', 'One'];

  void predictionAnalyze(String label, double confidence) {
    currentHandSign.value = levels[currentLevel.value];
    if (currentHandSign.value == label) {
      score.value++;
      currentLevel.value++;
      update();
    } else {
      print("Try Again");
      print("currentHandSign.value = " + currentHandSign.value);
    }
  }

  void onMatchGesture() {
    // Logic to check if the user's hand gesture matches the displayed gesture
    // Increment the score and move to the next level if it matches
    score.value++;
    currentLevel.value++;
    update(); // Notify listeners that the values have changed
  }
}
