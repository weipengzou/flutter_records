import 'package:get/get.dart';
import 'package:records/screen/home/home_controller.dart';
import 'package:records/screen/login/login_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
