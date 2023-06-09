import 'package:get/get.dart';

import '../modules/home_screen/binding/home_binding.dart';
import '../modules/home_screen/home_screen.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/splash_screen.dart';
import '../modules/test_screen/binding/test_binding.dart';
import '../modules/test_screen/test_screen.dart';
import '../modules/train_screen/binding/train_binding.dart';
import '../modules/train_screen/train_screen.dart';
import './app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.testScreen,
      page: () => const TestScreen(),
      binding: TestBinding(),
    ),
    GetPage(
      name: AppRoutes.trainScreen,
      page: () => const TrainScreen(),
      binding: TrainBinding(),
    )
  ];
}
