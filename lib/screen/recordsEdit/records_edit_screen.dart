import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';
import 'package:records/screen/recordsEdit/records_edit_controller.dart';
import 'package:records/common/widget/custom_quill/custom_quill.dart';
import 'package:records/screen/recordsEdit/widget/editor_save_btn.dart';
import 'package:records/screen/recordsEdit/widget/editor_send_btn.dart';

class RecordsEditScreen extends StatelessWidget {
  const RecordsEditScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppTheme.paddingSize / 2),
        child: Column(
          children: [
            Hero(
              tag: 'records-edit-button',
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppTheme.paddingSize / 2),
                child: Text(
                  'Add records',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(Get.context!).primaryColor,
                  ),
                ),
              ),
            ),
            _initEditor(),
            Row(
              children: const [
                Expanded(child: EditSaveButton()),
                SizedBox(width: 24),
                Expanded(child: EditSendButton())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _initEditor() {
    final recordsEditController = Get.put(RecordsEditController());
    return Expanded(
      child: Column(
        children: [
          CustomQuill(
            controller: recordsEditController.quillController.value,
          ).initToolBar(),
          Expanded(
            child: Hero(
              tag: 'records-editor',
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppTheme.paddingSize / 2),
                child: CustomCard(
                  padding: const EdgeInsets.all(AppTheme.radius),
                  child: Expanded(
                    child: CustomQuill(
                      controller: recordsEditController.quillController.value,
                    ).initEditor(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
