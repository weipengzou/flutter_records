import 'package:flutter/material.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';

class TabbarScaffold extends StatelessWidget {
  final Widget? child;

  const TabbarScaffold({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: child!,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
