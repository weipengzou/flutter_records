import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:records/common/index.dart'
    show CustomThemeColorExtension, CustomThemeSchemeExtension;
import 'package:records/common/themes/theme/dark/index.dart';
import 'package:records/common/themes/theme/light/index.dart';

class AppTheme {
  static bool isDark = Get.isDarkMode;
  // 获取主题 Color
  static CustomThemeColorExtension Function(BuildContext context)
      getColorScheme = (BuildContext context) =>
          Theme.of(context).extension<CustomThemeColorExtension>()!;
  // 获取主题 Scheme
  static CustomThemeSchemeExtension Function(BuildContext context)
      getKitScheme = (BuildContext context) =>
          Theme.of(context).extension<CustomThemeSchemeExtension>()!;
  // 亮色主题
  static final ThemeData lightTheme = lightThemeData;
  // 暗色主题
  static final ThemeData darkTheme = darkThemeData;
}

enum AppThemeSettingSize {
  large,
  middle,
  small,
}

class AppThemeSetting {
  final size = AppThemeSettingSize.large;
  // constant
  static const double radius = 25;
  static const double buttonRadius = 12;
  static const double marginSize = 24;
  static const double paddingSize = 24;

  AppThemeSetting() {
    print('AppThemeSetting init');
  }
}
