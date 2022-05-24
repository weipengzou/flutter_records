import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart';

/// ## 自定义弹出框
///
/// ### 封装Getx dialog，统一样式
///
/// **例子**:
///
/// ```dart
///   customDialog(middleText: '请先登陆账号', duration: const Duration(milliseconds: 3000));
/// ```
Future customDialog({
  String title = 'Alert',
  Widget? content,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  VoidCallback? onCustom,
  bool barrierDismissible = true,
  String? middleText,
  // onWillPop Scope
  WillPopCallback? onWillPop,
  Duration? duration,
}) async {
  final titleStyle = Theme.of(Get.context!).textTheme.bodyText1;
  final middleTextStyle = Theme.of(Get.context!).textTheme.bodyText2;
  final actionTextStyle = Theme.of(Get.context!).textTheme.bodyText2;
  final backgroundColor = AppTheme.getKitScheme(Get.context!)
      .background!
      .elevated
      .secondary
      ?.withOpacity(0.72);

  Widget actionItem({VoidCallback? onTap, required String text}) => Expanded(
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            onTap?.call();
            Get.back();
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: actionTextStyle?.copyWith(
              color: AppTheme.getColorScheme(Get.context!).blue,
            ),
          ),
        ),
      );
  final List<Widget> actions = [];
  if (onCancel != null) {
    final Widget cancelButton = actionItem(text: 'cancel', onTap: onCancel);
    actions.add(cancelButton);
  }
  if (onConfirm != null) {
    final Widget confirmButton = actionItem(text: 'ok', onTap: onCancel);
    actions.add(confirmButton);
  }

// 自定义 毛玻璃效果 dialog
  final Widget baseDialog = ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 320,
          maxWidth: 320,
          maxHeight: 165.5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppThemeSetting.radius),
            color:
                backgroundColor ?? Theme.of(Get.context!).dialogBackgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    if (middleText != null)
                      Text(
                        middleText,
                        style: middleTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (actions.isNotEmpty)
                Divider(
                  height: 1,
                  color: AppTheme.getColorScheme(Get.context!).gray06,
                ),
              if (actions.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                )
            ],
          ),
        ),
      ),
    ),
  );
  await Future.delayed(Duration.zero).then(
    (value) => Get.dialog(
      Center(child: baseDialog),
    ),
  );

  // dialog
  if (duration != null) {
    await duration.delay();
    Get.back();
  }
  return Future;
}
