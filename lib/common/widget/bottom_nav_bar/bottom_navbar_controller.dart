import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:records/screen/index.dart';

class BottomNavBarController extends GetxController {
  var navIndex = 0.obs;
  var navItems = [
    const HomeScreen(),
    const MineScreen(),
  ];
  changeNavIndex(int index) {
    navIndex.value = index;
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
