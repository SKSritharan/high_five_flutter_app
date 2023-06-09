import 'package:get/get.dart';

import '../controller/train_controller.dart';

class TrainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrainController());
  }
}
