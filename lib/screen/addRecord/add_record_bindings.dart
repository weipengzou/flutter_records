import 'package:get/get.dart';
import 'package:records/screen/addRecord/add_record_controller.dart';
import 'package:records/screen/login/login_controller.dart';

class AddRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecordController>(() => AddRecordController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
