import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart'
    show AppThemeSetting, CustomQuill, CustomCard;

import 'package:records/screen/records-edit/records_edit_controller.dart';
import 'package:records/screen/records-edit/widget/index.dart';

class RecordsEditScreen extends StatelessWidget {
  const RecordsEditScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppThemeSetting.paddingSize,
          horizontal: AppThemeSetting.paddingSize / 2,
        ),
        child: Column(
          children: [
            Hero(
              tag: 'records-edit-button',
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppThemeSetting.paddingSize / 2),
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
                    vertical: AppThemeSetting.paddingSize / 2),
                child: CustomCard(
                  padding: const EdgeInsets.all(AppThemeSetting.radius),
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
