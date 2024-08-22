class ProfileRequestModel {
  String? username;
  String? name;
  String? email;

  ProfileRequestModel({this.username, this.name, this.email});

  ProfileRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}