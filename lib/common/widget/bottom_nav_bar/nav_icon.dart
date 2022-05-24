part of './bottom_navbar.dart';

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
      duration: BottomNavBarController.animationDuration,
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              spreadRadius: -8,
              offset: const Offset(4, 4),
              color: active
                  ? Theme.of(context)
                      .extension<CustomThemeSchemeExtension>()!
                      .background!
                      .elevated
                      .tertiary!
                  : Colors.transparent),
          BoxShadow(
              blurRadius: 8,
              spreadRadius: -8,
              offset: const Offset(-4, -4),
              color: active
                  ? Theme.of(context)
                      .extension<CustomThemeSchemeExtension>()!
                      .background!
                      .elevated
                      .secondary!
                  : Colors.transparent),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 0.3, 0.7, 1],
          colors: [
            Color.lerp(
                AppTheme.getColorScheme(context).green, Colors.white, 0.7)!,
            Color.lerp(
                AppTheme.getColorScheme(context).green, Colors.white, 0.3)!,
            Color.lerp(
                AppTheme.getColorScheme(context).green, Colors.black, 0.3)!,
            Color.lerp(
                AppTheme.getColorScheme(context).green, Colors.black, 0.7)!,
          ],
        ),
        color: active
            ? AppTheme.getColorScheme(context).green
            : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _icon,
            // color: active
            //     ? AppThemeScheme.active
            //     : Theme.of(context).textTheme.bodyText2?.color,
          ),
        ],
      ),
    );
  }
}
