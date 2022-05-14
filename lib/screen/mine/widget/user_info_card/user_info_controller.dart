import 'package:get/get.dart';
import 'package:records/common/schemes/user/login_scheme.dart';
import 'package:records/common/schemes/user/user_scheme.dart';
import 'package:records/services/services.dart';

class UserInfoCardController extends GetxController {
  final showUserInfo = false.obs;
  final canUpdateUserInfo = false.obs;
  Future<LoginScheme> changeUserInfo(UserScheme? changeData) async {
    return await APIServices.userAPI.update(
      id: changeData?.id,
      account: changeData?.account,
      avatar: changeData?.avatar,
      displayName: changeData?.displayName,
      phone: changeData?.phone,
      email: changeData?.email,
    );
  }
}
