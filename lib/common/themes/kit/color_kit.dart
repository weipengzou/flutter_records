part of './index.dart';

class ThemeKit {
  Color? primary;
  Color? secondary;
  Color? tertiary;
  Color? quaternary;

  ThemeKit({
    this.primary,
    this.secondary,
    this.tertiary,
    this.quaternary,
  });
}

class ThemeSchemeBackground {
  ThemeKit base;
  ThemeKit elevated;
  ThemeSchemeBackground({required this.base, required this.elevated});
}

abstract class ThemeKitScheme {
  ThemeKit label;
  ThemeKit fill;
  ThemeSchemeBackground background;

  ThemeKitScheme({
    required this.background,
    required this.fill,
    required this.label,
  });
}
