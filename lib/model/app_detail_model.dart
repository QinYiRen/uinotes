import 'package:get/get.dart';

class AppDetailModel {
  List<Result>? result;
  int? code;
  bool? isVip;
  bool? isLogin;

  AppDetailModel({this.result, this.code, this.isVip, this.isLogin});

  AppDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] is List) {
      result = json["result"] == null
          ? null
          : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
    }
    code = json['code'];
    isVip = json['isVip'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['isVip'] = isVip;
    data['isLogin'] = isLogin;
    return data;
  }
}

class Result {
  String? id;
  String? uuid;
  int? height;
  int? width;
  String? url;
  String? logoUrl;
  String? app;
  String? appName;
  String? imageName;
  dynamic user;
  RxInt isCollection;
  String? order;

  Result(
      {this.id,
      this.uuid,
      this.height,
      this.width,
      this.url,
      this.logoUrl,
      this.app,
      this.appName,
      this.imageName,
      this.user,
      required this.isCollection,
      this.order});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        uuid: json["uuid"],
        height: json["height"],
        width: json["width"],
        url: json["url"],
        logoUrl: json["logoUrl"],
        app: json["app"],
        appName: json["appName"],
        imageName: json["imageName"],
        user: json["user"],
        isCollection: RxInt(json["isCollection"] ?? 0),
        order: json["order"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['height'] = height;
    data['width'] = width;
    data['url'] = url;
    data['logoUrl'] = logoUrl;
    data['app'] = app;
    data['appName'] = appName;
    data['imageName'] = imageName;
    data['user'] = user;
    data['isCollection'] = isCollection;
    data['order'] = order;
    return data;
  }
}
