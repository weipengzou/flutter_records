import 'package:get/get.dart';
import 'package:records/screen/records-edit/records_edit_controller.dart';

class RecordsEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordsEditController>(() => RecordsEditController());
  }
}
