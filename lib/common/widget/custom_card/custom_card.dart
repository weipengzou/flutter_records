import 'package:flutter/material.dart';
import 'package:records/common/themes/app_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child ?? const Text('card'),
      padding: const EdgeInsets.all(AppTheme.paddingSize),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppTheme.radius)),
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
