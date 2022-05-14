import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';
import 'package:records/screen/mine/mine_controller.dart';
import 'package:records/screen/mine/widget/feelback_card/feelback_card.dart';
import 'package:records/screen/mine/widget/setting_card/setting_card.dart';
import 'package:records/screen/mine/widget/user_info_card/user_info_card.dart';

class MineScreen extends GetView<MineController> {
  const MineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 50,
          ),
          const UserInfoCard(),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  SettingCard(),
                  TempCard(
                    child: Text('普通会员'),
                  ),
                  TempCard(
                    child: Text('我的记录'),
                  ),
                  FeelBackCard(),
                  TempCard(
                    child: Text('临时卡片'),
                  ),
                  TempCard(
                    child: Text('临时卡片'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: BottomNavBar.height)
        ],
      ),
    );
  }
}

class TempCard extends StatelessWidget {
  const TempCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('临时卡片'),
          // Text('还没想好放啥...'),
          child!
        ],
      ),
    );
  }
}
