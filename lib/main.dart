import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/screen/login/login_controller.dart';
import 'screen/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // lazyPut
  Get.lazyPut<AppThemeController>(() => AppThemeController());
  Get.lazyPut<LoginController>(() => LoginController());
  // run
  runApp(const MyApp());
}
