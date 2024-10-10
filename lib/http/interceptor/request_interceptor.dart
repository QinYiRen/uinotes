import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SharedPreferences pref = Get.find();
    
    if (pref.getString('uinotes_jwt') != null &&
        pref.getString('uinotes_jwt') != '') {
      options.headers.addAll({
        'Cookie': 'uinotes_jwt=${pref.getString('uinotes_jwt')}'
      });
    }
    if (options.path == '/signin') {
            options.headers.addAll({
        'Cookie': 'uinotes_svgInfo=${pref.getString('uinotes_svgInfo')}'
      });
    }
    super.onRequest(options, handler);
  }
}
