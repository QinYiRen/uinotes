// To parse this JSON data, do
//
//     final ctool = ctoolFromJson(jsonString);

import 'dart:convert';

List<PinDetailModel?>? ctoolFromJson(String str) => json.decode(str) == null ? [] : List<PinDetailModel?>.from(json.decode(str)!.map((x) => PinDetailModel.fromJson(x)));

String ctoolToJson(List<PinDetailModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class PinDetailModel {
    PinDetailModel({
        this.tag,
        this.imgUrl,
        this.version,
        this.description,
        this.catalogue,
        this.logo,
        this.app,
        this.uuid,
        this.catalogueId,
        this.appId,
        this.updateTime,
        this.company,
        this.height,
        this.closeHeight,
        this.palettes,
        this.resolution,
        this.appUuid,
        this.companyId,
        this.name,
        this.order,
        this.id,
        this.user,
        this.isCollection,
        this.logoUuid,
    });

    List<Tag?>? tag;
    String? imgUrl;
    String? version;
    String? description;
    String? catalogue;
    String? logo;
    String? app;
    String? uuid;
    int? catalogueId;
    String? appId;
    String? updateTime;
    String? company;
    int? height;
    int? closeHeight;
    Palettes? palettes;
    String? resolution;
    String? appUuid;
    int? companyId;
    String? name;
    String? order;
    String? id;
    String? user;
    dynamic isCollection;
    String? logoUuid;

    factory PinDetailModel.fromJson(Map<String, dynamic> json) => PinDetailModel(
        tag: json["tag"] == null ? [] : List<Tag?>.from(json["tag"]!.map((x) => Tag.fromJson(x))),
        imgUrl: json["imgUrl"],
        version: json["version"],
        description: json["description"],
        catalogue: json["catalogue"],
        logo: json["logo"],
        app: json["app"],
        uuid: json["uuid"],
        catalogueId: json["catalogueId"],
        appId: json["appId"],
        updateTime: json["updateTime"],
        company: json["company"],
        height: json["height"],
        closeHeight: json["closeHeight"],
        palettes: Palettes.fromJson(json["palettes"]),
        resolution: json["resolution"],
        appUuid: json["appUuid"],
        companyId: json["companyId"],
        name: json["name"],
        order: json["order"],
        id: json["id"],
        user: json["user"],
        isCollection: json["isCollection"],
        logoUuid: json["logoUuid"],
    );

    Map<String, dynamic> toJson() => {
        "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x!.toJson())),
        "imgUrl": imgUrl,
        "version": version,
        "description": description,
        "catalogue": catalogue,
        "logo": logo,
        "app": app,
        "uuid": uuid,
        "catalogueId": catalogueId,
        "appId": appId,
        "updateTime": updateTime,
        "company": company,
        "height": height,
        "closeHeight": closeHeight,
        "palettes": palettes!.toJson(),
        "resolution": resolution,
        "appUuid": appUuid,
        "companyId": companyId,
        "name": name,
        "order": order,
        "id": id,
        "user": user,
        "isCollection": isCollection,
        "logoUuid": logoUuid,
    };
}

class Palettes {
    Palettes({
        this.palettes,
    });

    List<Palette?>? palettes;

    factory Palettes.fromJson(Map<String, dynamic> json) => Palettes(
        palettes: json["palettes"] == null ? [] : List<Palette?>.from(json["palettes"]!.map((x) => Palette.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "palettes": palettes == null ? [] : List<dynamic>.from(palettes!.map((x) => x!.toJson())),
    };
}

class Palette {
    Palette({
        this.color,
        this.ratio,
        this.hashKey,
    });

    List<int?>? color;
    double? ratio;
    String? hashKey;

    factory Palette.fromJson(Map<String, dynamic> json) => Palette(
        color: json["color"] == null ? [] : List<int?>.from(json["color"]!.map((x) => x)),
        ratio: json["ratio"].toDouble(),
        hashKey: json["\u0024\u0024hashKey"],
    );

    Map<String, dynamic> toJson() => {
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "ratio": ratio,
        "\u0024\u0024hashKey": hashKey,
    };
}

class Tag {
    Tag({
        this.tag,
        this.tagId,
        this.tagGroupId,
    });

    String? tag;
    int? tagId;
    int? tagGroupId;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tag: json["tag"],
        tagId: json["tagId"],
        tagGroupId: json["tagGroupId"],
    );

    Map<String, dynamic> toJson() => {
        "tag": tag,
        "tagId": tagId,
        "tagGroupId": tagGroupId,
    };
}
