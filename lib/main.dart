import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:window_manager/window_manager.dart';
import 'screen/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (GetPlatform.isWindows) initWindow();
  initBindings();
  // run
  runApp(const MyApp());
}

void initWindow() async {
  windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow();
  windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  windowManager.setResizable(true);
  windowManager.setMinimumSize(const Size(1024, 680));
}

void initBindings() {
  Get.put<AppThemeController>(AppThemeController());
  Get.put<BottomNavBarController>(BottomNavBarController());
}
