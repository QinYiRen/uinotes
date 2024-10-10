import 'package:uinotes/http/request.dart';

class HttpUtil {
  static HttpRequest httpRequest = HttpRequest();

  static Future<dynamic> get(
    String path,
    dynamic parameters,
    Map<String, dynamic> queryParameters, {
    bool showLoading = false,
    bool showErrorMessage = true,
  }) async {
    return await httpRequest.request(
        path, HttpMethod.get, parameters, queryParameters);
  }

  static Future post(
    String path,
    dynamic parameters,
    Map<String, dynamic> queryParameters, {
    bool showLoading = false,
    bool showErrorMessage = true,
  }) async {
    return await httpRequest.request(
        path, HttpMethod.post, parameters, queryParameters);
  }
}
