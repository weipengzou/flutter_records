import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart'
    show AppThemeSetting, BottomNavBar, AppRoutes, RecordScheme;
import 'package:records/common/utils/index.dart';
import 'package:records/common/widget/index.dart'
    show CustomCard, CustomQuill, LoadingIcon;
import 'package:records/screen/home/home_controller.dart';
import 'package:records/screen/login/login_controller.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put<HomeController>(HomeController());

//     return ListView(
//       physics: const BouncingScrollPhysics(),
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(
//             vertical: AppThemeSetting.paddingSize,
//             horizontal: AppThemeSetting.paddingSize / 2,
//           ),
//           child: Column(
//             children: [
//               initAddRecods(),
//               const SizedBox(height: AppThemeSetting.paddingSize),
//               Obx(() => RecordsList(
//                     items: controller.recordList.value,
//                     isLoading: controller.isLoading.value,
//                   )),
//               SizedBox(height: BottomNavBar.height)
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget initAddRecods() {
//     final LoginController loginController = Get.find<LoginController>();
//     _onTap() async {
//       if (!loginController.isLogin.value) {
//         customDialog(
//           middleText: '请先登陆账号',
//           // duration: const Duration(milliseconds: 3000),
//           onConfirm: () {},
//           onCancel: () {},
//         );

//         return;
//       }
//       Get.toNamed(AppRoutes.recordsEdit);
//     }

//     return GestureDetector(
//       onTap: _onTap,
//       child: Stack(alignment: AlignmentDirectional.center, children: [
//         Positioned(
//           child: CustomCard(
//             child: const Hero(
//               tag: 'records-editor',
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           child: Column(
//             children: [
//               const Icon(
//                 Icons.add_box_outlined,
//                 size: 50.0,
//                 semanticLabel: 'add a records',
//               ),
//               Hero(
//                 tag: 'records-edit-button',
//                 child: Text(
//                   'Add records',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Theme.of(Get.context!).primaryColor,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class RecordsList extends StatelessWidget {
//   final bool isLoading;
//   final List<RecordScheme>? items;

//   const RecordsList({
//     Key? key,
//     this.isLoading = false,
//     this.items,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget initRecordsItem(RecordScheme recordItem) {
//       initChild(bool isLike) => CustomCard(
//             margin: const EdgeInsets.symmetric(
//                 vertical: AppThemeSetting.marginSize / 2),
//             child: Column(
//               children: [
//                 Text(recordItem.user!.displayName.toString()),
//                 ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     Container(
//                       constraints: const BoxConstraints(maxHeight: 50),
//                       child: CustomQuill(
//                         scrollable: false,
//                         controller: QuillController(
//                           document: Document.fromJson(
//                               jsonDecode(recordItem.content.toString())),
//                           selection: const TextSelection.collapsed(offset: 0),
//                         ),
//                         expands: false,
//                         readOnly: true,
//                         enableInteractiveSelection: false,
//                       ).initEditor(),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Row(
//                       children: [
//                         Text((isLike ? recordItem.like! + 1 : recordItem.like)
//                             .toString()),
//                         const SizedBox(width: 8),
//                         isLike
//                             ? const Icon(FontAwesomeIcons.solidHeart)
//                             : const Icon(FontAwesomeIcons.heart),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           );

//       return ObxValue(
//           (RxBool isLike) => GestureDetector(
//               onDoubleTap: () => isLike.toggle(),
//               child: initChild(isLike.value)),
//           false.obs);
//     }

// // 判断loading
//     if (isLoading) {
//       return const LoadingIcon();
//     }
// // 判断空值
//     if (items?.isEmpty ?? true) {
//       return Center(
//         child: Column(children: const [
//           Icon(FontAwesomeIcons.circleExclamation),
//           Text('暂无数据'),
//         ]),
//       );
//     }
//     final PageController controller = PageController();

//     return Expanded(
//       child: PageView(
//         children: [Text('Third Page')],
//       ),
//     );
//     // return ListView.builder(
//     //   shrinkWrap: true,
//     //   physics: const BouncingScrollPhysics(),
//     //   itemCount: items?.length,
//     //   itemBuilder: (context, index) {
//     //     final item = items![index];
//     //     return initRecordsItem(item);
//     //   },
//     // );
//   }
// }

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put<HomeController>(HomeController());

  Widget initPageView() {
    final items = controller.recordList.value;
    // if (items?.isEmpty ?? true) {
    //   return Center(
    //     child: Column(children: const [
    //       Icon(FontAwesomeIcons.circleExclamation),
    //       Text('暂无数据'),
    //     ]),
    //   );
    // }
    // return Text('data');
    return PageView.builder(
      itemCount: 100,
      scrollDirection: Axis.vertical,
      physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
      itemBuilder: (BuildContext context, int index) {
        return Text('data');
        // return Container(
        //   color: Colors.red,
        //   // child: Text('container$index'),
        //   child: Text(
        //     'container',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          height: 64.0,
          child: Container(
              width: context.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 1],
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('item1', style: TextStyle(color: Colors.white)),
                    Text('item2', style: TextStyle(color: Colors.white)),
                    Text('item3', style: TextStyle(color: Colors.white)),
                  ],
                ),
              )),
        ),
        Expanded(
          child: initPageView(),
        ),
      ],
    );
  }
}
