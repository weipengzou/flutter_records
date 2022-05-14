import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/common/schemes/record/record_scheme.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/common/widget/bottom_nav_bar/bottom_navbar.dart';
import 'package:records/common/widget/custom_card/custom_card.dart';
import 'package:records/common/widget/icons/index.dart';
import 'package:records/screen/home/home_controller.dart';
import 'package:records/screen/login/login_controller.dart';
import 'package:records/common/widget/custom_quill/custom_quill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: AppTheme.paddingSize,
            horizontal: AppTheme.paddingSize / 2,
          ),
          child: Column(
            children: [
              initAddRecods(),
              const SizedBox(height: AppTheme.paddingSize),
              Obx(() => RecordsList(
                    items: controller.recordList.value,
                    isLoading: controller.isLoading.value,
                  )),
              SizedBox(height: BottomNavBar.height)
            ],
          ),
        ),
      ],
    );
  }

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
}

class RecordsList extends StatelessWidget {
  final bool isLoading;
  final List<RecordScheme>? items;

  const RecordsList({
    Key? key,
    this.isLoading = false,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget initRecordsItem(RecordScheme e) {
      return CustomCard(
        margin: const EdgeInsets.symmetric(vertical: AppTheme.marginSize / 2),
        child: Column(
          children: [
            Text(e.user!.displayName.toString()),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 50),
                  child: CustomQuill(
                    scrollable: false,
                    controller: QuillController(
                      document:
                          Document.fromJson(jsonDecode(e.content.toString())),
                      selection: const TextSelection.collapsed(offset: 0),
                    ),
                    expands: false,
                    readOnly: true,
                    enableInteractiveSelection: false,
                  ).initEditor(),
                ),
              ],
            ),
            ObxValue((RxBool isClick) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      isClick.toggle();
                    },
                    child: Row(
                      children: [
                        Text((isClick.value ? e.like! + 1 : e.like).toString()),
                        const SizedBox(width: 8),
                        isClick.value
                            ? const Icon(FontAwesomeIcons.solidHeart)
                            : const Icon(FontAwesomeIcons.heart),
                      ],
                    ),
                  )
                ],
              );
            }, false.obs)
          ],
        ),
      );
    }

    if (isLoading) {
      return const LoadingIcon();
    }
    if (items?.isEmpty ?? true) {
      return Center(
        child: Column(children: const [
          Icon(FontAwesomeIcons.circleExclamation),
          Text('暂无数据'),
        ]),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = items![index];
        return initRecordsItem(item);
      },
    );
  }
}
