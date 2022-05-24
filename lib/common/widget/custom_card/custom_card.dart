import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/index.dart';

class CustomCard extends Card {
  @override
  final EdgeInsetsGeometry? margin;
  @override
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onTap;
  CustomCard({
    Key? key,
    this.child,
    this.margin,
    this.onTap,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  })  : padding = padding ?? const EdgeInsets.all(AppThemeSetting.paddingSize),
        borderRadius = borderRadius ?? BorderRadius.circular(0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: margin,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.3, 0.7],
              colors: [
                Theme.of(context)
                    .extension<CustomThemeSchemeExtension>()!
                    .background!
                    .elevated
                    .tertiary!,
                Theme.of(context)
                    .extension<CustomThemeSchemeExtension>()!
                    .background!
                    .elevated
                    .secondary!,
              ],
            ),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
