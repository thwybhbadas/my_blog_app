class FavoritesRequestModel {
  final int postId;

  FavoritesRequestModel({required this.postId});

  factory FavoritesRequestModel.fromJson(Map<String, dynamic> json) {
    return FavoritesRequestModel(postId: json['post_id']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    return data;
  }
}
