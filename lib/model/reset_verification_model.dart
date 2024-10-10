// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

ResetVerificationModel? ctoolFromJson(String str) => ResetVerificationModel.fromJson(json.decode(str));

String ctoolToJson(ResetVerificationModel? data) => json.encode(data!.toJson());

class ResetVerificationModel {
    ResetVerificationModel({
        this.status,
        this.msg,
    });

    int? status;
    String? msg;

    factory ResetVerificationModel.fromJson(Map<String, dynamic> json) => ResetVerificationModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
