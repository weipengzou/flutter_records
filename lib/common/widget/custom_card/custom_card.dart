import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';

class CustomCard extends Card {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  CustomCard({
    Key? key,
    this.child,
    this.margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  })  : padding = padding ?? const EdgeInsets.all(AppTheme.paddingSize),
        borderRadius = borderRadius ?? BorderRadius.circular(0),
        super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: margin,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 1],
              colors: [
                Theme.of(context)
                    .extension<CustomThemeColor>()!
                    .gradientColorForm!,
                Theme.of(context)
                    .extension<CustomThemeColor>()!
                    .gradientColorTo!,
              ],
            ),
          ),
          padding: padding,
          child: child,
          // child: Text(isTapDown.value.toString()),
        ),
      ),
    );
  }
}
