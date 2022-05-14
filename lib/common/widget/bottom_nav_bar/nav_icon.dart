import 'package:flutter/material.dart';
import 'package:records/common/themes/app_theme.dart';

class NavIcon extends StatelessWidget {
  final IconData? _icon;
  final bool active;
  final Function()? _onTap;
  static double width = 60.0;
  static double height = 60.0;

  const NavIcon({
    Key? key,
    icon,
    required this.active,
    Function()? onTap,
  })  : _onTap = onTap,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _onTap, child: _initIcon(context));
  }

  Widget _initIcon(context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? AppThemeScheme.activeBackground : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon,
            color: active
                ? AppThemeScheme.active
                : Theme.of(context).textTheme.bodyText2?.color,
          ),
        ],
      ),
    );
  }
}
