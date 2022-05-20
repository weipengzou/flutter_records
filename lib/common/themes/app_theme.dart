import 'package:flutter/material.dart';
import 'package:records/common/themes/dark_theme.dart';
import 'package:records/common/themes/light_theme.dart';

class AppTheme {
  // constant
  static const double radius = 25;
  static const double buttonRadius = 12;
  static const double marginSize = 24;
  static const double paddingSize = 24;
  // 获取主题 Scheme
  static CustomThemeColor Function(BuildContext context) getScheme =
      (BuildContext context) =>
          Theme.of(context).extension<CustomThemeColor>()!;

// 亮色主题
  static final ThemeData lightTheme = lightThemeData; // 暗色主题
  static final ThemeData darkTheme = darkThemeData;
}

// ThemeExtension
class CustomThemeColor extends ThemeExtension<CustomThemeColor> {
  const CustomThemeColor({
    required this.red,
    required this.green,
    required this.blue,
    required this.orange,
    required this.yellow,
    required this.purple,
    required this.primary,
    required this.background,
    required this.gradientColorForm,
    required this.gradientColorTo,
  });

  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? orange;
  final Color? yellow;
  final Color? purple;
  final Color? primary;
  final Color? background;
  final Color? gradientColorForm;
  final Color? gradientColorTo;

  @override
  ThemeExtension<CustomThemeColor> copyWith({
    Color? red,
    Color? green,
    Color? blue,
    Color? orange,
    Color? yellow,
    Color? purple,
    Color? primary,
    Color? background,
    Color? gradientColorForm,
    Color? gradientColorTo,
  }) {
    return CustomThemeColor(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      purple: purple ?? this.purple,
      primary: primary ?? this.primary,
      background: background ?? this.background,
      gradientColorForm: gradientColorForm ?? this.gradientColorForm,
      gradientColorTo: gradientColorTo ?? this.gradientColorTo,
    );
  }

  @override
  ThemeExtension<CustomThemeColor> lerp(
      ThemeExtension<CustomThemeColor>? other, double t) {
    if (other is! CustomThemeColor) return this;
    return CustomThemeColor(
      blue: Color.lerp(blue, other.blue, t),
      green: Color.lerp(green, other.green, t),
      orange: Color.lerp(orange, other.orange, t),
      purple: Color.lerp(purple, other.purple, t),
      red: Color.lerp(red, other.red, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      primary: Color.lerp(primary, other.primary, t),
      background: Color.lerp(background, other.background, t),
      gradientColorForm:
          Color.lerp(gradientColorForm, other.gradientColorForm, t),
      gradientColorTo: Color.lerp(gradientColorTo, other.gradientColorTo, t),
    );
  }
}
