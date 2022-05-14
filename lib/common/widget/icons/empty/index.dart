import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EmptyIcon extends StatelessWidget {
  const EmptyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = Get.put(EmptyController()).animationController;

    animationController.repeat();

    return Column(children: [
      RotationTransition(
        turns: animationController,
        child: const Icon(FontAwesomeIcons.spinner),
      ),
      const SizedBox(height: 12),
      const Text('loading ...'),
    ]);
  }
}

class EmptyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
}
