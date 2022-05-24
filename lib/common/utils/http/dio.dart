import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/common/index.dart';
import 'package:records/common/schemes/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'interceptors.dart';

// Dio 框架封装
class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: 'http://124.223.216.131:9000',
    // baseUrl: 'http://192.168.1.24:3000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  late final Dio instance = Dio(options);
  // 单例模式
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  DioClient._internal() {
    instance.interceptors.addAll([
      CustomInterceptors(),
    ]);
  }
}
