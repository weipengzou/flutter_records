// 主题开关
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppThemeController>();

    return Obx(
      () => CustomCard(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.vertical,
          children: [
            const Text('Theme'),
            AnimatedRotation(
              turns: controller.isDark.value ? 0 : 1,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 700),
              child: Icon(
                controller.isDark.value ? Icons.nightlight : Icons.light_mode,
                size: 32,
              ),
            ),
            Switch(
              onChanged: (bool value) => controller.toggleTheme(),
              value: controller.isDark.value,
            ),
          ],
        ),
      ),
    );
  }
}
