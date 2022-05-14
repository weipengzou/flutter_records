import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DarkThemeColorScheme {
  static const primary = Color(0xffffffff);
  static const secondary = Color(0xff96A7AF);
  static const background = Color(0xff30444E);

  static const red = Color(0xFFFF464F);
  static const active = Color(0xffffffff);
  static const activeBackground = Color(0xff25C685);
  // static const List<Color> gradientColor = [
  //   Color(0xff2A3C44),
  //   Color(0xff23343C),
  // ];
}

class LightThemeColorScheme {
  static const primary = Color(0xff1A3B34);
  static const secondary = Color(0xff899A96);
  static const background = Color(0xffEDF1FA);

  static const red = Color(0xFFFF464F);
  static const active = Color(0xffffffff);
  static const activeBackground = Colors.lightBlueAccent;
}

class AppTheme {
  // constant
  static var isDark = Get.isDarkMode;
  static const double radius = 25;
  static const double buttonRadius = 12;
  static const double marginSize = 24;
  static const double paddingSize = 24;

  // get red
  // static const Color red = Color(0xffFF464F);
  // static const Color orange = Color(0xffFF8A34);
  // static const Color yellow = Color(0xffFFBC25);
  // static const Color green = Color(0xff25C685);
  // static const Color blue = Color(0xff005DF2);
  // static const Color purple = Color(0xff6952DC);

  final _buttonShap = MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
// 亮色主题
  static final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: const Color(0xffEDF1FA),
      titleTextStyle: const TextStyle(color: LightThemeColorScheme.primary),
    ),
    primaryColor: const Color(0xff1A3B34),
    colorScheme: const ColorScheme.light().copyWith(
      primary: LightThemeColorScheme.primary,
      secondary: LightThemeColorScheme.secondary,
      surface: LightThemeColorScheme.background,
      background: LightThemeColorScheme.background,
    ),
    backgroundColor: const Color(0xffEDF1FA),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: LightThemeColorScheme.primary),
      bodyText2: TextStyle(color: LightThemeColorScheme.secondary),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(const Color(0xff40DF9F)),
        shape: AppTheme()._buttonShap,
      ),
    ),
  );
// 暗色主题
  static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: DarkThemeColorScheme.background,
      titleTextStyle: const TextStyle(color: DarkThemeColorScheme.primary),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: DarkThemeColorScheme.primary,
      secondary: DarkThemeColorScheme.secondary,
      surface: DarkThemeColorScheme.background,
      background: DarkThemeColorScheme.background,
    ),
    primaryColor: DarkThemeColorScheme.primary,
    backgroundColor: DarkThemeColorScheme.background,
    scaffoldBackgroundColor: const Color(0xff22343C),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: DarkThemeColorScheme.primary),
      bodyText2: TextStyle(color: DarkThemeColorScheme.secondary),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Color(0xff2A3C44),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(const Color(0xff40DF9F)),
        shape: AppTheme()._buttonShap,
      ),
    ),
  );
}

extension AppThemeScheme on ColorScheme {
  static get isDark => Get.isDarkMode;

  static Color get red =>
      isDark ? DarkThemeColorScheme.red : LightThemeColorScheme.red;
  static Color get active =>
      isDark ? DarkThemeColorScheme.active : LightThemeColorScheme.active;
  static Color get activeBackground => isDark
      ? DarkThemeColorScheme.activeBackground
      : LightThemeColorScheme.activeBackground;
  static Color get navbarColor =>
      isDark ? DarkThemeColorScheme.background : Colors.white;
}
