class CaptchaModel {
  String? data;

  CaptchaModel({this.data});

  CaptchaModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    return data;
  }
}
