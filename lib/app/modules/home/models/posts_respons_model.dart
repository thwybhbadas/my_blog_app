class PostsResponsModel {
  Data? data;
  String? message;

  PostsResponsModel({this.data, this.message});

  PostsResponsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? title;
  String? slug;
  String? content;
  String? image;
  String? createdAt;
  int? id;

  Data(
      {this.title,
      this.slug,
      this.content,
      this.image,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}