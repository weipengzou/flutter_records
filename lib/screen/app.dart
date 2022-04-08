import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/screen/home/home_screen.dart';
import 'package:records/common/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // systemUiOverlayStyleFn();
    final navController = Get.put(BottomNavBarController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      initialRoute: '/',
      unknownRoute: GetPage(name: '/', page: () => const HomeScreen()),
      getPages: AppPages.routes,
      home: Obx(
        () => Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: navController.navItems[navController.navIndex.value],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: BottomNavBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void systemUiOverlayStyleFn() {
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //全局设置透明
        statusBarIconBrightness:
            Get.isDarkMode ? Brightness.light : Brightness.dark
        //light:黑色图标 dark：白色图标
        //在此处设置statusBarIconBrightness为全局设置
        );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
