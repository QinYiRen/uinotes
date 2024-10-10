import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    SharedPreferences pref = Get.find();
    if (response.headers.map['Set-Cookie'] != null) {
      for (String cookie in response.headers.map['Set-Cookie']!) {
        if (cookie.contains("uinotes_jwt")) {
          RegExp regExp = RegExp(r"uinotes_jwt=(.*?);");
          Match match = regExp.firstMatch(cookie) as Match;
          var jwtValue = match.group(1);
          if (jwtValue != null) {
            pref.setString('uinotes_jwt', jwtValue);
          }
          break;
        }
      }
    }
    if (response.requestOptions.path == '/captcha') {
      String cookie = response.headers.map['set-cookie']!.elementAt(1);
      if (cookie.contains("uinotes_svgInfo")) {
        RegExp regExp = RegExp(r"uinotes_svgInfo=(.*?);");
        Match match = regExp.firstMatch(cookie) as Match;
        var svgInfo = match.group(1);
        if (svgInfo != null) {
          pref.setString('uinotes_svgInfo', svgInfo);
        }
      }
    }
    super.onResponse(response, handler);
  }
}
