part of './index.dart';

class ThemeTypography {
  static final largeTitle =
      TypographyItem(letter: 0.37, lineHeight: 41, size: 34, weight: 400);
  static final title1 =
      TypographyItem(letter: 0.36, lineHeight: 34, size: 28, weight: 400);
  static final title2 =
      TypographyItem(letter: 0.35, lineHeight: 28, size: 22, weight: 400);
  static final title3 =
      TypographyItem(letter: 0.34, lineHeight: 24, size: 20, weight: 400);
  static final headline =
      TypographyItem(letter: -0.41, lineHeight: 22, size: 17, weight: 600);
  static final body =
      TypographyItem(letter: -0.41, lineHeight: 22, size: 17, weight: 400);
  static final callout =
      TypographyItem(letter: -0.32, lineHeight: 21, size: 16, weight: 400);
  static final subHeadline =
      TypographyItem(letter: -0.24, lineHeight: 20, size: 15, weight: 400);
  static final footnote =
      TypographyItem(letter: -0.08, lineHeight: 18, size: 13, weight: 400);
  static final caption1 =
      TypographyItem(letter: -0.07, lineHeight: 16, size: 12, weight: 400);
  static final caption2 =
      TypographyItem(letter: -0.07, lineHeight: 13, size: 11, weight: 400);
}

class TypographyItem {
  double size;
  double weight;
  double lineHeight;
  double letter;
  TypographyItem({
    required this.letter,
    required this.lineHeight,
    required this.size,
    required this.weight,
  });
}
