import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_data.dart';

class BottomNavBarController extends GetxController {
  final RxInt navIndex = 0.obs;
  final List<Widget> navItems = icons.map((e) => e.page).toList();
  changeNavIndex(int index) {
    if (navIndex.value == index) return;
    navIndex.value = index;
    startBackgroundAnimation();
  }

  void startBackgroundAnimation() {
    final paintAnimationController = Get.put(ButtomBackgroundPaintController());
    final curIdx = navIndex.value;
    final process = curIdx / icons.length;
    paintAnimationController.xController
        .animateTo(process + ((1 / icons.length) / 2));
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
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late AnimationController yController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
}
