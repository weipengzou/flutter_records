import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_data.dart' as nav_data;
import 'package:records/common/widget/bottom_nav_bar/nav_icon.dart';
import 'dart:ui' as ui;

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({Key? key}) : super(key: key);
  static double height = 60.0;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    return SizedBox(
      width: appSize.width,
      height: BottomNavBar.height * 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            width: appSize.width,
            height: BottomNavBar.height,
            child: const ButtomBackgroundPaint(),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            width: appSize.width,
            height: BottomNavBar.height * 2,
            child: _initNav(),
          ),
        ],
      ),
    );
  }

  Widget _initNav() {
    final navController = Get.put(BottomNavBarController());

    final List<Widget> iconsWidgetList = [];

    for (var i = 0; i < nav_data.icons.length; i++) {
      final item = nav_data.icons[i];
      iconsWidgetList.add(
        Obx(
          () => Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: BottomNavBarController.animationDuration,
                  bottom: navController.navIndex.value == i
                      ? BottomNavBar.height / 2
                      : 0,
                  child: SizedBox(
                    height: BottomNavBar.height,
                    child: NavIcon(
                      onTap: () => navController.changeNavIndex(i),
                      icon: item.icon,
                      active: navController.navIndex.value == i,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Flex(
      direction: Axis.horizontal,
      children: iconsWidgetList,
    );
  }
}

// 背景
class ButtomBackgroundPaint extends GetView {
  const ButtomBackgroundPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = Get.put(ButtomBackgroundPaintController());

    final customCurve = CurveTween(curve: Curves.easeInOut);

    final xAnimation = Tween(
      begin: 0.0,
      end: context.width,
    ).animate(animationController.xController);

    final yAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -40.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -40.0, end: 40.0), weight: 50),
    ]).chain(customCurve).animate(animationController.yController);

    return AnimatedBuilder(
      animation: xAnimation,
      builder: (BuildContext context, Widget? child) => AnimatedBuilder(
        animation: yAnimation,
        builder: (BuildContext context, Widget? child) => CustomPaint(
          painter: ButtomBackgroundPainter(
            startX: xAnimation.value,
            startY: yAnimation.value,
          ),
        ),
      ),
    );
  }
}

class ButtomBackgroundPainter extends CustomPainter {
  late final double startX;
  late final double startY;
  ButtomBackgroundPainter({
    Key? key,
    required this.startX,
    required this.startY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final raduis = NavIcon.width;
    final paintStartX = startX - raduis * 1.25;
    final paintEndX = startX + raduis * 1.25;
    final center = paintStartX + ((paintEndX - paintStartX) / 2);
    // 三阶贝塞尔曲线
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(paintStartX, 0)
      ..cubicTo(
        paintStartX + raduis / 2,
        0,
        paintStartX + raduis / 2,
        startY,
        center,
        startY,
      )
      ..cubicTo(
        paintEndX - raduis / 2,
        startY,
        paintEndX - raduis / 2,
        0,
        paintEndX,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          // Colors.blue,
          // Colors.red,
          AppTheme.getScheme(Get.context!).gradientColorForm!,
          AppTheme.getScheme(Get.context!).gradientColorTo!,
        ],
      ).createShader(Offset.zero & size)
      ..color = AppTheme.getScheme(Get.context!).background!.withOpacity(0.8);

    // filter
    final filterPaint = Paint()
      ..color = Theme.of(Get.context!).colorScheme.primary
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 2.0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, filterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
