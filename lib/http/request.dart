import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/request_interceptor.dart';
import 'interceptor/response_interceptor.dart';
import 'request_api.dart';

class HttpRequest {
  static final HttpRequest _instance = HttpRequest._internal();
  factory HttpRequest() => _instance;
  static late final Dio dio;

  HttpRequest._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestUrl.baseUrl,
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
        sendTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Referer': 'https://uinotes.com',
        });
    dio = Dio(options);

    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(ResponseInterceptor());
    dio.interceptors.add(PrettyDioLogger());
  }

  Future request(
    String path,
    HttpMethod method,
    dynamic parameters,
    Map<String, dynamic> queryParameters, {
    bool showLoading = false,
    bool showErrorMessage = true,
  }) async {
    const Map<HttpMethod, String> methodValues = {
      HttpMethod.get: 'get',
      HttpMethod.post: 'post',
    };
    Options options = Options(method: methodValues[method]);

    try {
      if (showLoading) {
        EasyLoading.show(status: 'Loading...');
      }
      var response = await dio.request(path,
          data: parameters, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (err) {
      if (showErrorMessage) {
        if (err.type == DioExceptionType.connectionError) {
          EasyLoading.showError('检查网络连接');
        } else if (err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.receiveTimeout ||
            err.type == DioExceptionType.sendTimeout) {
          EasyLoading.showError('请求超时');
        } else {
          EasyLoading.showError(err.message ?? '请求错误');
        }
      }
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }
}

enum HttpMethod {
  get,
  post,
}
