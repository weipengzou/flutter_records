import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart'
    show AppTheme, AppThemeSetting, BottomNavBar;
import 'package:records/screen/records-edit/records_edit_controller.dart';

class EditSendButton extends StatelessWidget {
  const EditSendButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecordsEditController());
    return Container(
      height: BottomNavBar.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppThemeSetting.radius),
        color: AppTheme.getColorScheme(context).green,
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: AppThemeSetting.paddingSize),
      child: GestureDetector(
        onTap: () {
          List recordJsonData =
              controller.quillController.value.document.toDelta().toJson();
          controller.sendRecord(jsonEncode(recordJsonData));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '立即发送',
              // style: TextStyle(color: AppThemeScheme.active),
            ),
            SizedBox(width: 8),
            Icon(
              FontAwesomeIcons.solidPaperPlane,
              // color: AppThemeScheme.active,
            ),
          ],
        ),
      ),
    );
  }
}
