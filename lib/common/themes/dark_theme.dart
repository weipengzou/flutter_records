// 暗色主题
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/themes/color_scheme/dark_color_scheme.dart';

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    CustomThemeColor(
      blue: Color(0xff005DF2),
      green: Color(0xff25C685),
      orange: Color(0xffFF8A34),
      purple: Color(0xff6952DC),
      red: Color(0xffFF464F),
      yellow: Color(0xffFFBC25),
      primary: Color(0xff1A3B34),
      background: Color(0xff2A3C44),
      gradientColorForm: Color(0xff2A3C44),
      gradientColorTo: Color(0xff23343C),
    ),
  ],
  appBarTheme: const AppBarTheme().copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: DarkThemeColorScheme.background,
    titleTextStyle: const TextStyle(color: DarkThemeColorScheme.primary),
  ),
  // Card
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shadowColor: DarkThemeColorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTheme.radius),
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
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
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
);
