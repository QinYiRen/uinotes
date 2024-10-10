// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';


SearchPinModel? ctoolFromJson(String str) => SearchPinModel.fromJson(json.decode(str));

String ctoolToJson(SearchPinModel? data) => json.encode(data!.toJson());

class SearchPinModel {
    SearchPinModel({
        this.result,
        this.code,
        this.isVip,
        this.isLogin,
    });

    List<Result>? result;
    int? code;
    bool? isVip;
    bool? isLogin;

    factory SearchPinModel.fromJson(Map<String, dynamic> json) => SearchPinModel(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        code: json["code"],
        isVip: json["isVip"],
        isLogin: json["isLogin"],
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
        "code": code,
        "isVip": isVip,
        "isLogin": isLogin,
    };
}

class Result {
    Result({
        this.id,
        this.uuid,
        this.height,
        this.width,
        this.url,
        this.logoUrl,
        this.app,
        this.appName,
        this.logoUuid,
        this.imageName,
        this.user,
        required this.isCollection,
        this.order,
    });

    String? id;
    String? uuid;
    int? height;
    int? width;
    String? url;
    String? logoUrl;
    String? app;
    String? appName;
    String? logoUuid;
    String? imageName;
    dynamic user;
    RxInt isCollection;
    String? order;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        uuid: json["uuid"],
        height: json["height"],
        width: json["width"],
        url: json["url"],
        logoUrl: json["logoUrl"],
        app: json["app"],
        appName: json["appName"],
        logoUuid: json["logoUuid"],
        imageName: json["imageName"],
        user: json["user"],
        isCollection: RxInt(json["isCollection"] ?? 0),
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "height": height,
        "width": width,
        "url": url,
        "logoUrl": logoUrl,
        "app": app,
        "appName": appName,
        "logoUuid": logoUuid,
        "imageName": imageName,
        "user": user,
        "isCollection": isCollection,
        "order": order,
    };
}
