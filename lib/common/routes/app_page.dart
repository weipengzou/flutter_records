import 'package:get/get.dart';
import 'package:records/screen/index.dart';
import 'package:records/screen/login/login_bindings.dart';
import 'package:records/screen/mine/mine_bindings.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: "/",
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/mine",
      page: () => const MineScreen(),
      transition: Transition.fadeIn,
      binding: MineBinding(),
    ),
    GetPage(
      name: "/login",
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
