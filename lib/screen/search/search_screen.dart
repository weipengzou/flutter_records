import 'package:flutter/material.dart';
import 'package:records/common/index.dart' show AppThemeSetting;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppThemeSetting.paddingSize,
          horizontal: AppThemeSetting.paddingSize / 2,
        ),
        child: Column(
          children: const [
            Text('搜索'),
          ],
        ),
      ),
    );
  }
}
