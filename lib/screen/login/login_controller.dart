import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:records/common/schemes/user/user_scheme.dart';
import 'package:records/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final RxBool isLogin = false.obs;
  final RxString account = ''.obs;
  final RxString password = ''.obs;
  final Rx<UserScheme?> userInfo = Rxn<UserScheme>().value.obs;

  changeAccount(String val) => account.value = val;
  changePassword(String val) => password.value = val;

  registration() async {
    await APIServices.userAPI.register(
      account: account.value,
      password: password.value,
    );
  }

  signIn() async {
    final res = await APIServices.userAPI.login(
      account: account.value,
      password: password.value,
    );
    userInfo.value = res.user;
    isLogin.value = true;
    // 缓存token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', res.accessToken.toString());
  }

  signOut() async {
    userInfo.value = null;
    isLogin.value = false;
    // 清除token
    final prefs = await SharedPreferences.getInstance();
    Get.dialog(const Text('wating...'));
    await prefs.setString('accessToken', '');
  }
}
