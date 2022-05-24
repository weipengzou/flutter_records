part of './index.dart';

// 色板
class LightThemeScheme implements ThemeKitScheme {
  @override
  ThemeKit label = ThemeKit(
    primary: const Color(0xff000000),
    secondary: const Color(0xff3C3C43),
    tertiary: const Color(0xff3C3C43),
    quaternary: const Color(0xff3C3C43),
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
      primary: const Color(0xffFFFFFF),
      secondary: const Color(0xffFAFAFA),
      tertiary: const Color(0xffFFFFFF),
    ),
    elevated: ThemeKit(
      primary: const Color(0xffFFFFFF),
      secondary: const Color(0xffF2F2F7),
      tertiary: const Color(0xffFFFFFF),
    ),
  );
}

final lightCustomThemeSchemeExtension = CustomThemeSchemeExtension(
  label: LightThemeScheme().label,
  fill: LightThemeScheme().fill,
  background: LightThemeScheme().background,
);
