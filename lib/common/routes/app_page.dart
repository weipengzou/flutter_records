import 'package:get/get.dart';
import 'package:records/screen/addRecord/add_record_bindings.dart';
import 'package:records/screen/feelback/feelback_bindings.dart';
import 'package:records/screen/home/home_bindings.dart';
import 'package:records/screen/index.dart';
import 'package:records/screen/login/login_bindings.dart';
import 'package:records/screen/message/message_bindings.dart';
import 'package:records/screen/mine/mine_bindings.dart';
import 'package:records/screen/recordsEdit/records_edit_bindings.dart';
import 'package:records/screen/search/search_bindings.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      bindings: [
        HomeBinding(),
        RecordsEditBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.Mine,
      page: () => const MineScreen(),
      transition: Transition.fadeIn,
      bindings: [
        MineBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.Search,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.Message,
      page: () => const MessageScreen(),
      binding: MessageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.AddRecord,
      page: () => const AddRecordScreen(),
      binding: AddRecordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.RecordsEdit,
      page: () => const RecordsEditScreen(),
      binding: RecordsEditBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.FeelBack,
      page: () => const FeelBackScreen(),
      binding: FeelBackBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
