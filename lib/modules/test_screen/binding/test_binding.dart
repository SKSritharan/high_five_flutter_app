import 'package:get/get.dart';

import '../controller/test_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }
}
