import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart'
    show AppTheme, AppThemeSetting, BottomNavBar;
import 'package:records/screen/records-edit/records_edit_controller.dart';

class EditSaveButton extends StatelessWidget {
  const EditSaveButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecordsEditController());

    return Container(
      height: BottomNavBar.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppThemeSetting.radius),
        color: Theme.of(context).backgroundColor,
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: AppThemeSetting.paddingSize),
      child: GestureDetector(
        onTap: () async {
          List recordData =
              controller.quillController.value.document.toDelta().toJson();
          controller.saveRecordDraft(jsonEncode(recordData));
          Get.defaultDialog(content: const Text('保存成功'));
          await 1.delay();
          Get.back();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '保存草稿',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(width: 8),
          Icon(
            FontAwesomeIcons.floppyDisk,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ]),
      ),
    );
  }
}
