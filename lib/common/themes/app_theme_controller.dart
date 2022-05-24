import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  final RxBool isDark = (ThemeMode.system == ThemeMode.dark).obs;
  toggleTheme() {
    Get.changeThemeMode(
      isDark.value ? ThemeMode.light : ThemeMode.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //全局设置透明
      statusBarIconBrightness:
          isDark.value ? Brightness.dark : Brightness.light,
    ));
    isDark.toggle();
  }
}
