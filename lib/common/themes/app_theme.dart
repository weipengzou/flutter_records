import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkThemeColorScheme {
  static const primary = Color(0xffffffff);
  static const secondary = Color(0xff96A7AF);
  static const background = Color(0xff30444E);
  static const MaterialColor red = MaterialColor(
    0xFFFF464F,
    <int, Color>{
      0: Colors.transparent,
      25: Color(0xff623A42),
      75: Color(0xffFF575F),
      100: Color(0xFFFF464F),
    },
  );
  static const MaterialColor green = MaterialColor(
    0xff25C685,
    <int, Color>{
      0: Colors.transparent,
      25: Color(0xff286053),
      75: Color(0xff3DD598),
      100: Color(0xff25C685),
    },
  );
  static const List<Color> gradientColor = [
    Color(0xff2A3C44),
    Color(0xff23343C),
  ];
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

  static final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff1A3B34),
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xff1A3B34),
      secondary: const Color(0xff899A96),
      surface: const Color(0xffEDF1FA),
      background: const Color(0xffEDF1FA),
    ),
    backgroundColor: const Color(0xffEDF1FA),
    scaffoldBackgroundColor: const Color(0xffffffff),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xff1A3B34)),
      bodyText2: TextStyle(color: Color(0xff899A96)),
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

  static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
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
      bodyText1: TextStyle(color: Color(0xffffffff)),
      bodyText2: TextStyle(color: Color(0xff96A7AF)),
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
  get isDark => brightness == Brightness.dark;

  Color get red => isDark ? DarkThemeColorScheme.red : Colors.blue;
  Color get green => isDark ? DarkThemeColorScheme.green : Colors.blue;
  Color get navbarColor =>
      isDark ? DarkThemeColorScheme.background : Colors.white;
}
