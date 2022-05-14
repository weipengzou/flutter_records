import 'package:get/get.dart';
import 'package:records/common/themes/app_theme_controller.dart';

class AppThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppThemeController>(() => AppThemeController());
  }
}
