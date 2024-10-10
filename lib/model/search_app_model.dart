
class SearchAppModel {
    SearchAppModel({
        this.result,
        this.status,
        this.isLogin,
        this.isVip,
    });

    List<Result>?result;
    int? status;
    bool? isLogin;
    bool? isVip;

    factory SearchAppModel.fromJson(Map<String, dynamic> json) => SearchAppModel(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        status: json["status"],
        isLogin: json["isLogin"],
        isVip: json["isVip"],
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
        "status": status,
        "isLogin": isLogin,
        "isVip": isVip,
    };
}

class Result {
    Result({
        this.preview,
        this.num,
        this.name,
        this.uuid,
        this.description,
        this.version,
        this.logoUuid,
        this.updateTime,
        this.imageUuid,
        this.height,
    });

    String? preview;
    int? num;
    String? name;
    String? uuid;
    String? description;
    String? version;
    String? logoUuid;
    String? updateTime;
    List<String?>? imageUuid;
    List<int?>? height;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        preview: json["preview"],
        num: json["num"],
        name: json["name"],
        uuid: json["uuid"],
        description: json["description"],
        version: json["version"],
        logoUuid: json["logoUuid"],
        updateTime: json["updateTime"],
        imageUuid: json["imageUuid"] == null ? [] : List<String?>.from(json["imageUuid"]!.map((x) => x)),
        height: json["height"] == null ? [] : List<int?>.from(json["height"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "preview": preview,
        "num": num,
        "name": name,
        "uuid": uuid,
        "description": description,
        "version": version,
        "logoUuid": logoUuid,
        "updateTime": updateTime,
        "imageUuid": imageUuid == null ? [] : List<dynamic>.from(imageUuid!.map((x) => x)),
        "height": height == null ? [] : List<dynamic>.from(height!.map((x) => x)),
    };
}

