// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

DetailLikesActionModel? ctoolFromJson(String str) => DetailLikesActionModel.fromJson(json.decode(str));

String ctoolToJson(DetailLikesActionModel? data) => json.encode(data!.toJson());

class DetailLikesActionModel {
    DetailLikesActionModel({
        this.status,
        this.likesStatus,
        this.msg,
    });

    int? status;
    int? likesStatus;
    String? msg;

    factory DetailLikesActionModel.fromJson(Map<String, dynamic> json) => DetailLikesActionModel(
        status: json["status"],
        likesStatus: json["likesStatus"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "likesStatus": likesStatus,
        "msg": msg,
    };
}
