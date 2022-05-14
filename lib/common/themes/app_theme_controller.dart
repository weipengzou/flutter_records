import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  static const double radius = 25;
  static const double marginSize = 24;
  static const double paddingSize = 24;
  final isDarkMode = Get.isDarkMode.obs;

  changeTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
