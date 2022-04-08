import 'package:get/get.dart';
// import 'package:get/get.dart';

class MineController extends GetxController {
  final isLogin = false.obs;
  var userInfo = {}.obs;
  changeUserInfo(value) {
    userInfo = value;
  }
}
