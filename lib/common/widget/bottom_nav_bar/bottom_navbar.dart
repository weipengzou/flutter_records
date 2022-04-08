import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_icon.dart';

final icons = [
  {
    "icon": Icons.home,
    "path": "/",
  },
  {
    "icon": Icons.account_box,
    "path": "/mine",
  },
];

class BottomNavBar extends GetView<AppThemeController> {
  BottomNavBar({Key? key}) : super(key: key);
  static double height = 60.0;
  final navController = Get.put(BottomNavBarController());
  final paintAnimationController = Get.put(ButtomBackgroundPaintController());

  @override
  Widget build(BuildContext context) {
    _startBackgroundAnimation();
    final appSize = MediaQuery.of(context).size;

    return SizedBox(
      width: appSize.width,
      height: 150,
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
            height: 150,
            child: Obx(
              () => Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 1000),
                          bottom: navController.navIndex.value == 0
                              ? BottomNavBar.height / 2
                              : 0,
                          child: SizedBox(
                            height: BottomNavBar.height,
                            child: NavIcon(
                              onTap: () {
                                navController.changeNavIndex(0);
                                _startBackgroundAnimation();
                              },
                              icon: Icons.home,
                              active: navController.navIndex.value == 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 1000),
                          bottom: navController.navIndex.value == 1
                              ? BottomNavBar.height / 2
                              : 0,
                          child: SizedBox(
                            height: BottomNavBar.height,
                            child: NavIcon(
                              onTap: () {
                                navController.changeNavIndex(1);
                                _startBackgroundAnimation();
                              },
                              icon: Icons.account_box,
                              active: navController.navIndex.value == 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startBackgroundAnimation() {
    final curIdx = navController.navIndex.value;
    final process = curIdx / icons.length;
    paintAnimationController.xController
        .animateTo(process + ((1 / icons.length) / 2));
    paintAnimationController.yController.reset();
    paintAnimationController.yController.forward();
  }
}

// 背景
class ButtomBackgroundPaint extends GetView {
  const ButtomBackgroundPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animationController = Get.put(ButtomBackgroundPaintController());

    final customCurve = CurveTween(curve: Curves.easeInOut);

    final xAnimation = Tween(
      begin: 0.0,
      end: context.width,
    ).animate(_animationController.xController);

    final yAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -40.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -40.0, end: 40.0), weight: 50),
    ]).chain(customCurve).animate(_animationController.yController);

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
    final _startX = startX - raduis * 1.25;
    final endX = startX + raduis * 1.25;
    final center = _startX + ((endX - _startX) / 2);
    // 三阶贝塞尔曲线
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(_startX, 0)
      ..cubicTo(
        _startX + raduis / 2,
        0,
        _startX + raduis / 2,
        startY,
        center,
        startY,
      )
      ..cubicTo(
        endX - raduis / 2,
        startY,
        endX - raduis / 2,
        0,
        endX,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final colorScheme = Theme.of(Get.context!).colorScheme;

    final paint = Paint()..color = colorScheme.background.withOpacity(0.9);

    // filter
    final filterPaint = Paint()
      ..color = colorScheme.primary
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 3.0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, filterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
