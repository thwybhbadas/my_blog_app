class ProfileResponseModel {
 final int id;
  final int userId;
  final String username;
  final String name;
  final String email;

  ProfileResponseModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.name,
    required this.email,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      id: json['id'],
      userId: json['user_id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'name': name,
      'email': email,
    };
  }
}
// class ProfileResponseModel {
//   int id;
//   String name;
//   String email;
//   String username;
//   Null bio;
//   int userId;
//   String createdAt;
//   String updatedAt;
//   User user;

//   ProfileResponseModel(
//       {required this.id,
//       required this.name,
//       required this.email,
//       required this.username,
//       this.bio,
//       required this.userId,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.user});

//   factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
//     return ProfileResponseModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       username: json['username'],
//       bio: json['bio'],
//       userId: json['user_id'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       user: json['user'],
//     );
//   }
// }

// class User {
//   int id;
//   String phone;
//   String createdAt;
//   String updatedAt;

//   User(
//       {required this.id,
//       required this.phone,
//       required this.createdAt,
//       required this.updatedAt});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       phone: json['phone'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }
