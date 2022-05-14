import 'package:get/get.dart';
import 'package:records/screen/feelback/feelback_controller.dart';

class FeelBackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeelBackController>(() => FeelBackController());
  }
}
