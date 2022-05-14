import 'package:get/get.dart';
import 'package:records/common/schemes/user/user_scheme.dart';
// import 'package:get/get.dart';

class MineController extends GetxController {
  Rx<UserScheme?> userInfo = Rxn<UserScheme>().value.obs;

  changeUserInfo(UserScheme value) {
    userInfo.value = value;
  }
}
