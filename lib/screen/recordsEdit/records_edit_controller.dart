import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:records/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordsEditController extends GetxController {
  final Rx<QuillController> quillController = (QuillController.basic()).obs;
  // 发送
  sendRecord(String value) async {
    final res = await APIServices.recordAPI
        .createRecord(title: 'default title', content: value);
  }

  // todo
  // 保存
  saveRecordDraft(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('recordDraft', value);
  }

  getRecordDraft(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getString('recordDraft');
  }
}
