import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_data.dart' as nav_data;

class BottomNavBarController extends GetxController {
  final RxInt navIndex = 0.obs;
  final List<Widget> navItems = nav_data.icons.map((e) => e.page).toList();
  static const animationDuration = Duration(milliseconds: 600); // 底部导航动画时长

  changeNavIndex(int index) {
    if (navIndex.value == index) return;
    navIndex.value = index;
    startBackgroundAnimation();
  }

  void startBackgroundAnimation() async {
    final paintAnimationController = Get.put(ButtomBackgroundPaintController());
    final curIdx = navIndex.value;
    final process = curIdx / nav_data.icons.length;
    paintAnimationController.xController.animateTo(
      process + ((1 / nav_data.icons.length) / 2),
      curve: Curves.easeInOut,
    );
    paintAnimationController.yController
        .drive(CurveTween(curve: Curves.easeInOut));
    paintAnimationController.yController.reset();
    paintAnimationController.yController.forward();
  }

  @override
  void onInit() {
    startBackgroundAnimation();
    super.onInit();
  }
}

class ButtomBackgroundPaintController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController xController = AnimationController(
    duration: BottomNavBarController.animationDuration,
    vsync: this,
  );
  late AnimationController yController = AnimationController(
    duration: BottomNavBarController.animationDuration,
    vsync: this,
  );
}
