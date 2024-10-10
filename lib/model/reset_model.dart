// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

ResetModel? ctoolFromJson(String str) => ResetModel.fromJson(json.decode(str));

String ctoolToJson(ResetModel? data) => json.encode(data!.toJson());

class ResetModel {
    ResetModel({
        this.status,
        this.msg,
    });

    int? status;
    String? msg;

    factory ResetModel.fromJson(Map<String, dynamic> json) => ResetModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
