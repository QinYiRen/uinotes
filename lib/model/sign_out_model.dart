// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

SignOutModel? ctoolFromJson(String str) => SignOutModel.fromJson(json.decode(str));

String ctoolToJson(SignOutModel? data) => json.encode(data!.toJson());

class SignOutModel {
    SignOutModel({
        this.status,
        this.msg,
    });

    int? status;
    String? msg;

    factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
