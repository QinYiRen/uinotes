class SearchWordModel {
  SearchWordModel({
    this.uuid,
    this.version,
    this.name,
    this.pinyin,
    this.logo,
    this.updateTime,
    this.logoUuid,
    this.updateTimeChange,
    this.type,
  });

  String? uuid;
  String? version;
  String? name;
  String? pinyin;
  String? logo;
  int? updateTime;
  String? logoUuid;
  String? updateTimeChange;
  String? type;

  factory SearchWordModel.fromJson(Map<String, dynamic> json) =>
      SearchWordModel(
        uuid: json["uuid"],
        version: json["version"],
        name: json["name"],
        pinyin: json["pinyin"],
        logo: json["logo"],
        updateTime: json["updateTime"],
        logoUuid: json["logoUuid"],
        updateTimeChange: json["updateTimeChange"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "version": version,
        "name": name,
        "pinyin": pinyin,
        "logo": logo,
        "updateTime": updateTime,
        "logoUuid": logoUuid,
        "updateTimeChange": updateTimeChange,
        "type": type,
      };

  static List<SearchWordModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map<SearchWordModel>((json) => SearchWordModel.fromJson(json))
        .toList();
  }
}
