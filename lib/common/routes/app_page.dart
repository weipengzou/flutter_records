part of './index.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      bindings: [
        HomeBinding(),
        RecordsEditBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.mine,
      page: () => const MineScreen(),
      transition: Transition.fadeIn,
      bindings: [
        MineBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.message,
      page: () => const MessageScreen(),
      binding: MessageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.addRecord,
      page: () => const AddRecordScreen(),
      binding: AddRecordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.recordsEdit,
      page: () => const RecordsEditScreen(),
      binding: RecordsEditBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.feelBack,
      page: () => const FeelBackScreen(),
      binding: FeelBackBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
