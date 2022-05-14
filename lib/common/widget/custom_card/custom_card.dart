import 'package:flutter/material.dart';
import 'package:records/common/themes/app_theme.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry? _margin;
  final EdgeInsetsGeometry? _padding;
  final BorderRadiusGeometry? _borderRadius;
  CustomCard({
    Key? key,
    required this.child,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  })  : _margin = margin ?? const EdgeInsets.all(0),
        _padding = padding ?? const EdgeInsets.all(AppTheme.paddingSize),
        _borderRadius = borderRadius ?? BorderRadius.circular(AppTheme.radius),
        super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
