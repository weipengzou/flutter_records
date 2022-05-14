import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:window_manager/window_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  @override
  final Size preferredSize = const Size.fromHeight(50.0);

  CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return _init();
  }

  Widget _init() {
    if (GetPlatform.isWindows) {
      return _initWindowBar();
    }
    if (GetPlatform.isMobile) {
      return _initMobileBar();
    }
    return Container();
  }

  Widget _initWindowBar() {
    return AppBar(
      title: Text(title ?? ''),
      flexibleSpace: SizedBox(
        height: 50,
        child: GestureDetector(
          onTap: () {},
          onTapDown: (TapDownDetails tapDownDetails) =>
              windowManager.startDragging(),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8),
                child: const Image(
                  image: AssetImage(
                    'assets/images/records_logo.png',
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () => windowManager.close(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _initMobileBar() {
    return AppBar(
        // title: const Text('mobilie appbar'),
        );
  }
}
