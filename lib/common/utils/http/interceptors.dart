part of 'dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("🟡REQUEST URL: ${options.uri}");
    print("🟡REQUEST DATA: ${options.data}");
    customDialog(
      middleText: 'wating...',
    );
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken') ?? '';
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) async {
    Get.back();
    final resData = ApiResponse.fromMap(response.data); // 统一API返回格式
    response.data = resData.data;
    print('🟢RESPONSE DATA: ${resData.toMap()}');
    // dialog
    customDialog(
      middleText: resData.message.toString(),
      duration: const Duration(milliseconds: 1000),
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print('🔴RESPONSE ERROR: ${err.response?.data ?? err.error}');
    Get.back();
    final errRes = jsonDecode(err.response.toString());
    Get.defaultDialog(content: Text(errRes?['message'] ?? errRes.toString()));
    await 2.delay();
    Get.back();
  }
}
