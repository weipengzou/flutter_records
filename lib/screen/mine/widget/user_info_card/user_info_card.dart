import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/screen/login/login_controller.dart';
import 'package:records/screen/mine/widget/user_info_card/user_info_controller.dart';
import 'package:records/screen/mine/widget/user_info_card/user_info_form.dart';

const _duration = Duration(milliseconds: 300);

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final UserInfoCardController controller = Get.put(UserInfoCardController());
    var userInfo = loginController.userInfo;
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(vertical: 24),
        color: Theme.of(context).backgroundColor,
        child: GestureDetector(
          onTap: () {
            loginController.isLogin.value
                ? controller.showUserInfo.toggle()
                : Get.toNamed(AppRoutes.Login);
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        child: loginController.isLogin.value
                            ? Text(
                                userInfo.value?.displayName == ''
                                    ? 'default name'
                                    : userInfo.value?.displayName ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                ))
                            : const Text('Login',
                                style: TextStyle(
                                  fontSize: 36,
                                )),
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: loginController.isLogin.value ? 1 : 0,
                    child: AnimatedRotation(
                      turns: controller.showUserInfo.value ? 0 : 0.5,
                      duration: _duration,
                      child: const Icon(
                        Icons.keyboard_double_arrow_up_rounded,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
              const UserInfoBoard()
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoBoard extends StatelessWidget {
  const UserInfoBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final UserInfoCardController controller = Get.put(UserInfoCardController());
    GestureDetector signOutButton() => GestureDetector(
          onTap: () async {
            await loginController.signOut();
            Get.back();
            if (!loginController.isLogin.value) {
              controller.showUserInfo.toggle();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(AppTheme.radius),
            ),
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: Axis.horizontal,
              children: [
                const Text('Sign Out'),
                Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        );

    return Obx(
      () => AnimatedContainer(
        height: controller.showUserInfo.value ? 300 : 0,
        duration: _duration,
        curve: Curves.fastOutSlowIn,
        child: AnimatedOpacity(
          duration: _duration,
          opacity: controller.showUserInfo.value ? 1 : 0,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const UserInfoForm(),
              signOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
