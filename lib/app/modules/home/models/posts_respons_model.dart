class PostsResponsModel {
  Posts? posts;
  String? message;

  PostsResponsModel({this.posts, this.message});

  PostsResponsModel.fromJson(Map<String, dynamic> json) {
    posts = json['posts'] != null ?  Posts.fromJson(json['posts']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Posts {
  String title;
  String slug;
  String content;
  String image;
  String createdAt;
  int id;

  Posts(
      {required this.title,
      required this.slug,
      required this.content,
      required this.image,
      required this.createdAt,
      required this.id});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        title: json['title'],
        slug: json['slug'],
        content: json['content'],
        image: json['image'],
        createdAt: json['created_at'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> posts = <String, dynamic>{};
    posts['title'] = title;
    posts['slug'] = slug;
    posts['content'] = content;
    posts['image'] =image;
    posts['created_at'] =createdAt;
    posts['id'] = id;
    return posts;
  }
}
