class FavoritesResponsModel {
  bool data;
  Null message;

  FavoritesResponsModel({required this.data, this.message});

 factory FavoritesResponsModel.fromJson(Map<String, dynamic> json) {
    return FavoritesResponsModel(data: json['data']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}