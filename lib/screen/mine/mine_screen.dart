import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(vertical: 24),
          color: Theme.of(context).backgroundColor,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  'assets/images/Profile_Picture.png',
                  cacheWidth: 60,
                  cacheHeight: 60,
                  width: 60,
                  height: 60,
                ),
              ),
              Hero(
                tag: 'login.text',
                child: InkWell(
                  onTap: () => Get.toNamed('/login'),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: const Text(
            'Card List',
            style: TextStyle(fontSize: 24),
          ),
        ),
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
                  child: Text('临时卡片'),
                ),
                TempCard(
                  child: Text('临时卡片'),
                ),
                TempCard(
                  child: Text('临时卡片'),
                ),
                TempCard(
                  child: Text('临时卡片'),
                ),
                TempCard(
                  child: Text('临时卡片'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

// 主题开关
class SettingCard extends GetView<AppThemeController> {
  const SettingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
              tag: 'mine.settings', child: Icon(Icons.settings, size: 36)),
          const SizedBox(height: 12),
          Text(
            'App主题: ${Get.isDarkMode ? 'dark' : 'light'}',
          ),
          Switch(
            onChanged: (bool value) {
              controller.changeTheme();
            },
            value: Get.isDarkMode,
          ),
        ],
      ),
    );
  }
}

// 国际化开关
class IntelCard extends StatelessWidget {
  const IntelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 国际化开关
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
