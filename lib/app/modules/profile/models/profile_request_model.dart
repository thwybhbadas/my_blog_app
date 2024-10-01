
class ProfileRequestModel {
  final String username;
  final String name;
  final String email;

  ProfileRequestModel({
    required this.username,
    required this.name,
    required this.email,
  });
 
  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return ProfileRequestModel(
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
    };
  }
}
