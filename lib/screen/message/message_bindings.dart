import 'package:get/get.dart';
import 'package:records/screen/message/message_controller.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
