class AppDetailCountModel {
  int? num;

  AppDetailCountModel({this.num});

  AppDetailCountModel.fromJson(Map<String, dynamic> json) {
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    return data;
  }
}
