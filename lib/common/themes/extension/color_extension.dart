part of './index.dart';

// ThemeExtension
class CustomThemeColorExtension
    extends ThemeExtension<CustomThemeColorExtension> {
  const CustomThemeColorExtension({
    required this.red,
    required this.green,
    required this.blue,
    required this.teal,
    required this.indigo,
    required this.pink,
    required this.gray,
    required this.gray02,
    required this.gray03,
    required this.gray04,
    required this.gray05,
    required this.gray06,
    required this.orange,
    required this.yellow,
    required this.purple,
  });

  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? teal;
  final Color? indigo;
  final Color? pink;
  final Color? gray;
  final Color? gray02;
  final Color? gray03;
  final Color? gray04;
  final Color? gray05;
  final Color? gray06;
  final Color? orange;
  final Color? yellow;
  final Color? purple;

  @override
  ThemeExtension<CustomThemeColorExtension> copyWith({
    Color? red,
    Color? green,
    Color? blue,
    Color? orange,
    Color? yellow,
    Color? pink,
    Color? indigo,
    Color? teal,
    Color? purple,
    Color? gray,
    Color? gray01,
    Color? gray02,
    Color? gray03,
    Color? gray04,
    Color? gray05,
    Color? gray06,
    Color? primary,
    Color? background,
    Color? gradientColorForm,
    Color? gradientColorTo,
  }) {
    return CustomThemeColorExtension(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      purple: purple ?? this.purple,
      pink: pink ?? this.pink,
      indigo: indigo ?? this.indigo,
      teal: teal ?? this.teal,
      gray: gray ?? this.gray,
      gray02: gray02 ?? this.gray02,
      gray03: gray03 ?? this.gray03,
      gray04: gray04 ?? this.gray04,
      gray05: gray05 ?? this.gray05,
      gray06: gray06 ?? this.gray06,
    );
  }

  @override
  ThemeExtension<CustomThemeColorExtension> lerp(
      ThemeExtension<CustomThemeColorExtension>? other, double t) {
    if (other is! CustomThemeColorExtension) return this;
    return CustomThemeColorExtension(
      blue: Color.lerp(blue, other.blue, t),
      green: Color.lerp(green, other.green, t),
      orange: Color.lerp(orange, other.orange, t),
      purple: Color.lerp(purple, other.purple, t),
      red: Color.lerp(red, other.red, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      indigo: Color.lerp(indigo, other.indigo, t),
      pink: Color.lerp(pink, other.pink, t),
      teal: Color.lerp(teal, other.teal, t),
      gray: Color.lerp(gray, other.gray, t),
      gray02: Color.lerp(gray02, other.gray02, t),
      gray03: Color.lerp(gray03, other.gray03, t),
      gray04: Color.lerp(gray04, other.gray04, t),
      gray05: Color.lerp(gray05, other.gray05, t),
      gray06: Color.lerp(gray06, other.gray06, t),
    );
  }
}
