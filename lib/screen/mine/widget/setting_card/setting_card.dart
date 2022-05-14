// 主题开关
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppThemeController>();

    return ObxValue(
        (RxBool isChangeTheme) => GestureDetector(
              onTap: () {
                controller.changeTheme();
                isChangeTheme.toggle();
              },
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Theme'),
                    const SizedBox(height: 12),
                    AnimatedRotation(
                      turns: isChangeTheme.value ? 0 : 1,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 700),
                      child: Icon(
                        controller.isDarkMode.value
                            ? Icons.nightlight
                            : Icons.light_mode,
                        size: 32,
                      ),
                    ),
                    Switch(
                      onChanged: (bool value) {
                        controller.changeTheme();
                        isChangeTheme.toggle();
                      },
                      value: controller.isDarkMode.value,
                    ),
                  ],
                ),
              ),
            ),
        false.obs);
  }
}
