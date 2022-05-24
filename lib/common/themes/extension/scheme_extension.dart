part of './index.dart';

// ThemeExtension

class CustomThemeSchemeExtension
    extends ThemeExtension<CustomThemeSchemeExtension> {
  final ThemeKit? label;
  final ThemeKit? fill;
  final ThemeSchemeBackground? background;
  CustomThemeSchemeExtension({
    required this.label,
    required this.fill,
    required this.background,
  });

  @override
  ThemeExtension<CustomThemeSchemeExtension> copyWith({
    ThemeKit? label,
    ThemeKit? fill,
    ThemeSchemeBackground? background,
  }) {
    return CustomThemeSchemeExtension(
      label: label ?? this.label,
      fill: fill ?? this.fill,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<CustomThemeSchemeExtension> lerp(
      ThemeExtension<CustomThemeSchemeExtension>? other, double t) {
    if (other is! CustomThemeSchemeExtension) return this;
    return CustomThemeSchemeExtension(
      label: label ?? this.label,
      fill: fill ?? this.fill,
      background: background ?? this.background,
      // red: Color.lerp(red, other.red, t),
    );
  }
}
