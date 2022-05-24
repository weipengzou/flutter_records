// 暗色主题
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:records/common/index.dart';
part 'dark_color_extension.dart';
part 'dark_scheme_extension.dart';

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    darkCustomThemeColorExtension,
    darkCustomThemeSchemeExtension
  ],
  appBarTheme: const AppBarTheme().copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: DarkThemeScheme().background.base.primary,
    titleTextStyle: TextStyle(color: DarkThemeScheme().label.primary),
  ),
  // Card
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: DarkThemeScheme().background.elevated.secondary,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppThemeSetting.radius),
    ),
  ),
  iconTheme: IconThemeData(
    color: darkCustomThemeSchemeExtension.label?.secondary,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    primary: DarkThemeScheme().label.primary,
    secondary: DarkThemeScheme().label.secondary,
    surface: DarkThemeScheme().label.tertiary,
    background: DarkThemeScheme().background.base.secondary,
  ),
  primaryColor: DarkThemeScheme().label.primary,
  backgroundColor: DarkThemeScheme().background.elevated.secondary,
  scaffoldBackgroundColor: DarkThemeScheme().background.base.secondary,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: DarkThemeScheme().label.primary,
      fontSize: ThemeTypography.body.size,
      letterSpacing: ThemeTypography.body.letter,
    ),
    bodyText2: TextStyle(
      color: DarkThemeScheme().label.secondary,
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
