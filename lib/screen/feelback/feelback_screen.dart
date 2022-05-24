import 'package:flutter/material.dart';
import 'package:records/common/index.dart' show AppThemeSetting;

class FeelBackScreen extends StatelessWidget {
  const FeelBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppThemeSetting.marginSize),
        child: Column(
          children: [
            const Text('FeelBack'),
            const Text('人人都是产品经理'),
            TextField(controller: textFieldController),
            ElevatedButton(
              onPressed: () {
                print(textFieldController.text);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
