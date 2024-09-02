class Profiles {
  final int id;
  final String name;
  final String email;
  final String username;
  final Null bio;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final User user;

  Profiles(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.bio,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      required this.user});

  factory Profiles.fromJson(Map<String, dynamic> json) {
    return Profiles(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      username: json['username'],
      bio: json['bio'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: json['user'],
    );
  }
}

class User {
  final int id;
  final String phone;
  final String createdAt;
  final String updatedAt;

  User(
      {required this.id,
      required this.phone,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        phone: json['phone'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
 
  
}
