// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'package:get/get.dart';

class LikesModel {
  LikesModel({
    this.id,
    this.uuid,
    this.height,
    this.width,
    this.url,
    this.logoUrl,
    this.logoUuid,
    this.app,
    this.appName,
    this.imageName,
    this.order,
    required this.isCollection,
  });

  String? id;
  String? uuid;
  int? height;
  int? width;
  String? url;
  String? logoUrl;
  String? logoUuid;
  String? app;
  String? appName;
  String? imageName;
  String? order;
  RxInt isCollection;

  factory LikesModel.fromJson(Map<String, dynamic> json) => LikesModel(
        id: json["id"],
        uuid: json["uuid"],
        height: json["height"],
        width: json["width"],
        url: json["url"],
        logoUrl: json["logoUrl"],
        logoUuid: json["logoUuid"],
        app: json["app"],
        appName: json["appName"],
        imageName: json["imageName"],
        order: json["order"],
        isCollection: RxInt(json["isCollection"] ?? 0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "height": height,
        "width": width,
        "url": url,
        "logoUrl": logoUrl,
        "logoUuid": logoUuid,
        "app": app,
        "appName": appName,
        "imageName": imageName,
        "order": order,
        "isCollection": isCollection,
      };
  static List<LikesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map<LikesModel>((json) => LikesModel.fromJson(json))
        .toList();
  }
}
