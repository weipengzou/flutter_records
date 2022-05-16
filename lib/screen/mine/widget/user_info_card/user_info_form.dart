import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/screen/login/login_controller.dart';
import 'package:records/screen/mine/widget/user_info_card/user_info_controller.dart';

class UserInfoFormItem {
  String label;
  String value;
  void Function(String? value) onSave;
  String? Function(String?)? validator;

  UserInfoFormItem({
    required this.label,
    required this.onSave,
    required this.value,
    this.validator,
  });
}

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    final UserInfoCardController controller = Get.put(UserInfoCardController());
    var userInfo = loginController.userInfo;

    final List<UserInfoFormItem> userInfoLabel = [
      UserInfoFormItem(
        label: 'Display Name',
        onSave: (String? value) {
          userInfo.value?.displayName = value!;
        },
        value: userInfo.value?.displayName ?? 'undefinded',
        // validator: (String? value) => value!.isEmpty ? "请输入参数" : null,
      ),
      UserInfoFormItem(
        label: 'Email',
        onSave: (String? value) {
          userInfo.value?.email = value!;
        },
        value: userInfo.value?.email ?? 'undefinded',
        // validator: (String? value) => value!.isEmpty ? "请输入参数" : null,
      ),
      UserInfoFormItem(
        label: 'Phone',
        onSave: (String? value) {
          userInfo.value?.phone = value!;
        },
        value: userInfo.value?.phone ?? 'undefinded',
        // validator: (String? value) => value!.isEmpty ? "请输入参数" : null,
      ),
    ];
    List<Widget> userInfoWidget = [];

    for (var item in userInfoLabel) {
      userInfoWidget.add(
        Obx(
          () => Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text(item.label)),
              const Expanded(flex: 1, child: Text(":")),
              Expanded(
                flex: 2,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: item.onSave,
                  initialValue: item.value,
                  validator: item.validator,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                    enabled: controller.canUpdateUserInfo.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    final formKey = GlobalKey<FormState>();
    return Obx(() => Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              ...userInfoWidget,
              GestureDetector(
                onTap: () async {
                  if (controller.canUpdateUserInfo.value) {
                    if (formKey.currentState!.validate()) {
                      await controller.changeUserInfo(userInfo.value);
                      formKey.currentState!.save();
                    } else {
                      Get.defaultDialog(content: const Text('无效参数'));
                    }
                    Timer(const Duration(seconds: 1), () => Get.back());
                  }
                  controller.canUpdateUserInfo.toggle();
                },
                child: controller.canUpdateUserInfo.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserInfoFormButton(
                            text: 'Cancel',
                            onTap: () {
                              formKey.currentState?.reset();
                              controller.canUpdateUserInfo.toggle();
                            },
                          ),
                          const SizedBox(width: AppTheme.paddingSize),
                          UserInfoFormButton(
                            text: 'Confirm',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await controller.changeUserInfo(userInfo.value);
                                formKey.currentState!.save();
                              } else {
                                Get.defaultDialog(content: const Text('无效参数'));
                              }
                              await 1.delay();
                              Get.back();
                              controller.canUpdateUserInfo.toggle();
                            },
                          )
                        ],
                      )
                    : UserInfoFormButton(
                        text: 'Edit',
                        onTap: () => controller.canUpdateUserInfo.toggle(),
                      ),
              )
            ],
          ),
        ));
  }
}

class UserInfoFormButton extends StatelessWidget {
  final Function()? _onTap;
  final String _text;
  const UserInfoFormButton({
    Key? key,
    required String text,
    Function()? onTap,
  })  : _onTap = onTap,
        _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppTheme.radius),
          ),
        ),
        child: Text(_text),
      ),
    );
  }
}
