import 'package:get/get.dart';
import 'package:records/screen/mine/mine_controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}
