// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

MemberExchangeModel? ctoolFromJson(String str) => MemberExchangeModel.fromJson(json.decode(str));

String ctoolToJson(MemberExchangeModel? data) => json.encode(data!.toJson());

class MemberExchangeModel {
    MemberExchangeModel({
        this.status,
        this.msg,
    });

    int? status;
    String? msg;

    factory MemberExchangeModel.fromJson(Map<String, dynamic> json) => MemberExchangeModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
