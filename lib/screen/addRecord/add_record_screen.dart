import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/screen/login/login_controller.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({Key? key}) : super(key: key);
  Widget initAddRecods() {
    final LoginController loginController = Get.put(LoginController());
    _onTap() async {
      if (!loginController.isLogin.value) {
        Get.defaultDialog(
          content: const Text('请先登陆账号'),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.back();
        return;
      }
      Get.toNamed(AppRoutes.RecordsEdit);
    }

    return GestureDetector(
      onTap: _onTap,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Positioned(
          child: Hero(
            tag: 'records-editor',
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                  color: Theme.of(Get.context!).colorScheme.background,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Column(
            children: [
              const Icon(
                Icons.add_box_outlined,
                size: 50.0,
                semanticLabel: 'add a records',
              ),
              Hero(
                tag: 'records-edit-button',
                child: Text(
                  'Add records',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(Get.context!).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppTheme.paddingSize,
          horizontal: AppTheme.paddingSize / 2,
        ),
        child: Column(
          children: [
            initAddRecods(),
          ],
        ),
      ),
    );
  }
}
