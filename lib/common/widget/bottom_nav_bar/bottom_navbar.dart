import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar_controller.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_data.dart';
import 'package:records/common/widget/bottom_nav_bar/nav_icon.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({Key? key}) : super(key: key);
  static double height = 60.0;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    return Container(
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

    final List<Widget> _icons = [];

    for (var i = 0; i < icons.length; i++) {
      final item = icons[i];
      _icons.add(
        Obx(
          () => Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1000),
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
      children: _icons,
    );
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
