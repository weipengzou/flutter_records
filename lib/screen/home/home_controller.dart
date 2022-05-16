import 'package:get/get.dart';
import 'package:records/common/schemes/record/record_scheme.dart';
import 'package:records/services/services.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final Rx<List<RecordScheme>?> recordList =
      Rxn<List<RecordScheme>>().value.obs;
  @override
  void onInit() async {
    await _init();
    super.onInit();
  }

  _init() async {
    isLoading.value = true;
    final homeRecordList = await APIServices.recordAPI.getRecordList();
    recordList.value = homeRecordList;
    isLoading.value = false;
  }
}
