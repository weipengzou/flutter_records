import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';
import 'package:records/screen/recordsEdit/records_edit_controller.dart';

class EditSendButton extends StatelessWidget {
  const EditSendButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RecordsEditController());
    return Container(
      height: BottomNavBar.height,
      decoration: BoxDecoration(
        color: AppThemeScheme.activeBackground,
        borderRadius: BorderRadius.circular(AppTheme.radius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingSize),
      child: GestureDetector(
        onTap: () {
          List recordJsonData =
              _controller.quillController.value.document.toDelta().toJson();
          _controller.sendRecord(jsonEncode(recordJsonData));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '立即发送',
              style: TextStyle(color: AppThemeScheme.active),
            ),
            const SizedBox(width: 8),
            Icon(
              FontAwesomeIcons.solidPaperPlane,
              color: AppThemeScheme.active,
            ),
          ],
        ),
      ),
    );
  }
}
