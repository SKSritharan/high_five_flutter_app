import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/widgets/custom_card.dart';
import './controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                animationAsset: 'assets/animations/pigeon.json',
                gradientColors: const [
                  Color(0xffb4e4ff),
                  Color(0xff95bdff),
                ],
                title: 'Train',
                onPressed: () {
                  Get.toNamed(AppRoutes.trainScreen);
                },
              ),
              CustomCard(
                animationAsset: 'assets/animations/tiger.json',
                gradientColors: const [
                  Color(0xfffdb6da),
                  Color(0xfffa91c7),
                ],
                title: 'Test',
                onPressed: () {
                  Get.toNamed(AppRoutes.testScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
