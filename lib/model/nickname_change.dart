// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

NicknameChangeModel? ctoolFromJson(String str) => NicknameChangeModel.fromJson(json.decode(str));

String ctoolToJson(NicknameChangeModel? data) => json.encode(data!.toJson());

class NicknameChangeModel {
    NicknameChangeModel({
        this.status,
    });

    int? status;

    factory NicknameChangeModel.fromJson(Map<String, dynamic> json) => NicknameChangeModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
