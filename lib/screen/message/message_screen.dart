import 'package:flutter/material.dart';
import 'package:records/common/themes/app_theme.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppTheme.paddingSize,
          horizontal: AppTheme.paddingSize / 2,
        ),
        child: Column(
          children: const [
            Text('我的消息'),
          ],
        ),
      ),
    );
  }
}
