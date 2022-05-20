import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  final isDarkMode = Get.isDarkMode.obs;

  changeTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
