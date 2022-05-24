import 'package:get/get.dart';
import 'package:records/screen/mine/mine_controller.dart';
import 'package:records/screen/mine/widget/user-info-card/user_info_controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
    Get.lazyPut<UserInfoCardController>(() => UserInfoCardController());
  }
}
