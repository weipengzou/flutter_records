import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:records/common/schemes/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("🟡REQUEST URL: ${options.uri}");
    print("🟡REQUEST DATA: ${options.data}");
    Get.defaultDialog(
      content: const Text('wating...'),
    );
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
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
    Get.defaultDialog(content: Text(resData.message.toString()));
    await 1.delay();
    Get.back();
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print('🔴RESPONSE ERROR: ${err.response?.data ?? err.error}');
    Get.back();
    final errRes = jsonDecode(err.response.toString());
    Get.defaultDialog(content: Text(errRes?['message'] ?? errRes.toString()));
    await 1.delay();
    Get.back();
  }
}
