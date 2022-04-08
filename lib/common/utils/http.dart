import 'package:dio/dio.dart';

// 配置项
BaseOptions options = BaseOptions(
  // 请求基地址,可以包含子路径
  baseUrl: '',

  // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
  //连接服务器超时时间，单位是毫秒.
  connectTimeout: 10000,

  // 响应流上前后两次接受到数据的间隔，单位为毫秒。
  receiveTimeout: 5000,

  // Http请求头.
  headers: {},

  /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
  /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
  /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
  /// 就会自动编码请求体.
  contentType: 'application/json; charset=utf-8',

  /// [responseType] 表示期望以那种格式(方式)接受响应数据。
  /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
  ///
  /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
  /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
  ///
  /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
  responseType: ResponseType.json,
);

// 拦截器
InterceptorsWrapper interceptors =
    InterceptorsWrapper(onRequest: (options, handler) {
  // Do something before request is sent
  return handler.next(options); //continue
  // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
  // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
  //
  // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
  // 这样请求将被中止并触发异常，上层catchError会被调用。
}, onResponse: (response, handler) {
  // Do something with response data
  return handler.next(response); // continue
  // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
  // 这样请求将被中止并触发异常，上层catchError会被调用。
}, onError: (DioError e, handler) {
  // Do something with response error
  return handler.next(e); //continue
  // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
  // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
});

// 实例对象
final dioInstance = Dio(options).interceptors.add(interceptors);

final http = dioInstance;
