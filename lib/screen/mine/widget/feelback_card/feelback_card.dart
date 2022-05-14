import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';

class FeelBackCard extends StatelessWidget {
  const FeelBackCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/feelback'),
      child: CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('建议反馈'),
            SizedBox(height: 12),
            Icon(
              FontAwesomeIcons.solidMessage,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
