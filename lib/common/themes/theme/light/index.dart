// 暗色主题
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/index.dart';
part 'light_color_extension.dart';
part 'light_scheme_extension.dart';

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    lightCustomThemeColorExtension,
    lightCustomThemeSchemeExtension
  ],
  appBarTheme: const AppBarTheme().copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: LightThemeScheme().background.base.primary,
    titleTextStyle: TextStyle(color: LightThemeScheme().label.primary),
  ),
  // Card
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: LightThemeScheme().background.base.primary,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppThemeSetting.radius),
    ),
  ),
  iconTheme: IconThemeData(
    color: lightCustomThemeSchemeExtension.label?.secondary,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    primary: LightThemeScheme().label.primary,
    secondary: LightThemeScheme().label.secondary,
    surface: LightThemeScheme().label.tertiary,
    background: LightThemeScheme().background.base.secondary,
  ),
  primaryColor: LightThemeScheme().label.primary,
  backgroundColor: LightThemeScheme().background.elevated.secondary,
  scaffoldBackgroundColor: LightThemeScheme().background.base.secondary,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: LightThemeScheme().label.primary,
      fontSize: ThemeTypography.title1.size,
      letterSpacing: ThemeTypography.title1.letter,
    ),
    bodyText2: TextStyle(
      color: LightThemeScheme().label.secondary,
      fontSize: ThemeTypography.body.size,
      letterSpacing: ThemeTypography.body.letter,
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppThemeSetting.buttonRadius),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(AppThemeSetting.paddingSize),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppThemeSetting.buttonRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppThemeSetting.buttonRadius),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    ),
  ),
);
