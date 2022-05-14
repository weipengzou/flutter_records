import 'package:get/get.dart';
import 'package:records/screen/recordsEdit/records_edit_controller.dart';

class RecordsEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordsEditController>(() => RecordsEditController());
  }
}
