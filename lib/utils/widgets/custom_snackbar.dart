import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType {
  success,
  error,
  info,
}

void showCustomSnackbar(
  String message,
  SnackType type, {
  SnackPosition position = SnackPosition.BOTTOM,
  Color? colorText,
  double borderRadius = 10,
  Color? backgroundColor,
}) {
  Color snackColor;
  IconData iconData;
  String title;

  switch (type) {
    case SnackType.success:
      title = 'Success';
      snackColor = Colors.green;
      iconData = Icons.check;
      break;
    case SnackType.error:
      title = 'Error';
      snackColor = Colors.red;
      iconData = Icons.close;
      break;
    case SnackType.info:
      title = 'Info';
      snackColor = Colors.blue;
      iconData = Icons.warning;
      break;
  }

  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 2),
    snackPosition: position,
    colorText: colorText ?? Colors.white,
    borderRadius: borderRadius,
    backgroundColor: backgroundColor ?? snackColor,
    icon: Icon(iconData),
  );
}
