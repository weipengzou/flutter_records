import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/themes/color_scheme/light_color_scheme.dart';

// 亮色主题
final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    CustomThemeColor(
      blue: Color(0xff005DF2),
      green: Color(0xff25C685),
      orange: Color(0xffFF8A34),
      primary: Color(0xffFFFFFF),
      purple: Color(0xff6952DC),
      red: Color(0xffFF464F),
      yellow: Color(0xffFFBC25),
      background: Color(0xffFFFFFF),
      gradientColorForm: Color(0xffFAFBFC),
      gradientColorTo: Color(0xffF2F3FB),
      // backgroundGradientColorForm: Color(0xffFAFBFC),
      // backgroundGradientColorTo: Color(0xffF2F3FB),
    ),
  ],
  appBarTheme: const AppBarTheme().copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: const Color(0xffEDF1FA),
    titleTextStyle: const TextStyle(color: LightThemeColorScheme.primary),
  ),
  // Card
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shadowColor: LightThemeColorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTheme.radius),
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.light,
    primary: LightThemeColorScheme.primary,
    secondary: LightThemeColorScheme.secondary,
    surface: LightThemeColorScheme.background,
    background: LightThemeColorScheme.background,
  ),
  primaryColor: const Color(0xff2A3C44),
  backgroundColor: const Color(0xffEDF1FA),
  // scaffoldBackgroundColor: LinearGradient(
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   stops: const [0, 1],
  //   colors: [
  //     Theme.of(context).extension<CustomThemeColor>()!.gradientColorForm!,
  //     Theme.of(context).extension<CustomThemeColor>()!.gradientColorTo!,
  //   ],
  // ),
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
    ),
  ),
);
