import 'package:flutter/material.dart';
import 'package:records/common/index.dart' show AppThemeSetting;
import 'package:records/common/utils/index.dart' show customDialog;

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppThemeSetting.paddingSize,
          horizontal: AppThemeSetting.paddingSize / 2,
        ),
        child: Column(
          children: [
            Text('我的消息'),
            Container(
              child: GestureDetector(
                child: Text('data'),
                onTap: () => customDialog(title: 'temp test'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
