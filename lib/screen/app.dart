import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/services/services.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/screen/home/home_screen.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/screen/login/login_controller.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initUser();
    systemUiOverlayStyleFn(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      unknownRoute: GetPage(name: '/', page: () => const HomeScreen()),
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
          // appBar: CustomAppBar(),
          resizeToAvoidBottomInset: false,
          
          body: SizedBox(
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
    );
  }
}

initUser() async {
  final controller = Get.put(LoginController());
  final user = await APIServices.userAPI.getUserInfo();
  controller.userInfo.trigger(user);
  controller.isLogin.value = true;
}

void systemUiOverlayStyleFn(context) {
  // final isDark =
  // ThemeMode.system == ThemeMode.dark ? Brightness.light : Brightness.dark;
  if (GetPlatform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //全局设置透明
      // statusBarIconBrightness:
      //     ? Brightness.dark
      //     : Brightness.light
      // statusBarIconBrightness: isDark
      //light:黑色图标 dark：白色图标
      //在此处设置statusBarIconBrightness为全局设置
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
