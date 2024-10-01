
class VerifyRequestModel {
  String? code;
  String? phone;

  VerifyRequestModel({this.code, this.phone});

  VerifyRequestModel.fromJson(Map<String, dynamic> json) {
    
    code = json['code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data['code'] = code;
    data['phone'] = phone;
    return data;
  }
}