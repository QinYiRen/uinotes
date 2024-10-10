// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

UploadModel? ctoolFromJson(String str) => UploadModel.fromJson(json.decode(str));

String ctoolToJson(UploadModel? data) => json.encode(data!.toJson());

class UploadModel {
    UploadModel({
        this.status,
        this.filename,
        this.msg,
    });

    int? status;
    String? filename;
    String? msg;

    factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
        status: json["status"],
        filename: json["filename"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "filename": filename,
        "msg": msg,
    };
}
