part of './index.dart';

// 色板
class DarkThemeScheme implements ThemeKitScheme {
  @override
  ThemeKit label = ThemeKit(
    primary: const Color(0xffFFFFFF),
    secondary: const Color(0xffEBEBF5),
    tertiary: const Color(0xffEBEBF5),
    quaternary: const Color(0xffEBEBF5),
  );
  @override
  ThemeKit fill = ThemeKit(
    primary: const Color(0xff787880),
    secondary: const Color(0xff787880),
    tertiary: const Color(0xff787880),
    quaternary: const Color(0xff787880),
  );

  @override
  ThemeSchemeBackground background = ThemeSchemeBackground(
    base: ThemeKit(
      primary: const Color(0xff000000),
      secondary: const Color(0xff1C1C1E),
      tertiary: const Color(0xff2C2C2E),
    ),
    elevated: ThemeKit(
      primary: const Color(0xff1C1C1E),
      secondary: const Color(0xff2C2C2E),
      tertiary: const Color(0xff3A3A3C),
    ),
  );
}

final darkCustomThemeSchemeExtension = CustomThemeSchemeExtension(
  label: DarkThemeScheme().label,
  fill: DarkThemeScheme().fill,
  background: DarkThemeScheme().background,
);
