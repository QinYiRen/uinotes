class SearchCountModel {
  List<Tag>? tag;
  List<Types>? type;

  SearchCountModel({this.tag, this.type});

  SearchCountModel.fromJson(Map<String, dynamic> json) {
    if (json['tag'] is List) {
      tag = json["tag"] == null
          ? null
          : (json["tag"] as List).map((e) => Tag.fromJson(e)).toList();
    }
    if (json['type'] is List) {
      type = json["type"] == null
          ? null
          : (json["type"] as List).map((e) => Types.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tag != null) {
      data['tag'] = tag?.map((v) => v.toJson()).toList();
    }
    if (type != null) {
      data['type'] = type?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  String? name;

  Tag({this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Types {
  late int typeNum;
  Types({required this.typeNum});

  Types.fromJson(Map<String, dynamic> json) {
    typeNum = json['typeNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['typeNum'] = typeNum;
    return data;
  }
}
