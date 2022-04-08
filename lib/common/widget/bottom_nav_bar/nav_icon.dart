import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    onTap,
  })  : _onTap = onTap,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: _onTap, child: _initIcon());
  }

  Widget _initIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? const Color(0xff3DD599) : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon,
            color: active
                ? Theme.of(Get.context!).primaryColor
                : Theme.of(Get.context!).textTheme.bodyText2?.color,
          ),
        ],
      ),
    );
  }
}
