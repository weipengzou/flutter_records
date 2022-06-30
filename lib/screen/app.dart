import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/screen/home/home_bindings.dart';
import 'package:records/services/services.dart';
import 'package:records/screen/login/login_controller.dart';
import 'package:records/common/index.dart'
    show AppTheme, AppPages, BottomNavBar;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initUser();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // unknownRoute:
      //     GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
      initialBinding: HomeBinding(),
      // initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
      home: _init(),
    );
  }

  Widget _init() {
    final navController = Get.put(BottomNavBarController());
    int backNum = 0;
    return WillPopScope(
      onWillPop: () {
        backNum++;
        if (backNum < 2) {
          navController.changeNavIndex(0);
          Get.defaultDialog(
            title: '',
            titleStyle: const TextStyle(height: 0),
            middleText: "再按一次退出",
          ).timeout(const Duration(seconds: 1), onTimeout: () => Get.back());
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: navController.navItems[navController.navIndex.value],
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    child: BottomNavBar(),
                  ),
                  // const Positioned(
                  //   child: PerformanceOverlay(
                  //     optionsMask: 999999,
                  //     rasterizerThreshold: 1,
                  //     checkerboardRasterCacheImages: true,
                  //     checkerboardOffscreenLayers: true,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

initUser() async {
  final controller = Get.put(LoginController());
  final user = await APIServices.userAPI.getUserInfo();
  controller.userInfo.trigger(user);
  controller.isLogin.value = true;
}
