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
  double? borderRadius,
  Color? backgroundColor,
}) {
  Color? snackColor;
  Icon? icon;
  String? title;
  switch (type) {
    case SnackType.success:
      String title = 'Success';
      snackColor = Colors.green;
      Icon? icon = Icon(Icons.check);
      break;
    case SnackType.error:
      String title = 'Error';
      snackColor = Colors.red;
      Icon? icon = Icon(Icons.close);
      break;
    case SnackType.info:
      String title = 'Info';
      snackColor = Colors.blue;
      Icon? icon = Icon(Icons.warning);
      break;
  }

  Get.snackbar(
    title!,
    message,
    snackPosition: position,
    colorText: colorText ?? Colors.white,
    borderRadius: borderRadius ?? 10,
    backgroundColor: backgroundColor ?? snackColor,
    icon: icon,
  );
}
