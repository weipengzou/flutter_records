import 'package:records/common/schemes/user/login_scheme.dart';
import 'package:records/common/schemes/user/user_scheme.dart';
import 'package:records/common/utils/http.dart';

class UserAPI {
  static final dio = DioClient().instance;
  Future<UserScheme> getUserInfo() async {
    final res = await dio.get('/user/info');
    final user = UserScheme.fromMap(res.data);
    return user;
  }

  Future<UserScheme> register({
    required String account,
    required String password,
  }) async {
    final res = await dio.post('/user/register', data: {
      "account": account,
      "password": password,
    });
    final user = UserScheme.fromMap(res.data);
    return user;
  }

  Future<LoginScheme> login({
    required String account,
    required String password,
  }) async {
    final res = await dio.post('/auth/login', data: {
      "account": account,
      "password": password,
    });
    final LoginScheme userInfo = LoginScheme.fromMap(res.data);
    return userInfo;
  }

  Future<LoginScheme> update({
    String? account,
    String? displayName,
    String? email,
    String? id,
    String? phone,
    String? avatar,
  }) async {
    final res = await dio.post('/user/update', data: {
      'account': account ?? '',
      'displayName': displayName ?? '',
      'email': email ?? '',
      'id': id ?? '',
      'phone': phone ?? '',
      'avatar': avatar ?? '',
    });
    final LoginScheme userInfo = LoginScheme.fromMap(res.data);
    return userInfo;
  }

  Future<LoginScheme> auth({
    required String account,
    required String password,
  }) async {
    final res = await dio.post('/auth/login', data: {
      "account": account,
      "password": password,
    });
    final LoginScheme userInfo = LoginScheme.fromMap(res.data);
    return userInfo;
  }
}
