class SignupResponsModel { 
  Data? data; 
  Null? message; 
 
  SignupResponsModel({this.data, this.message}); 
 
  SignupResponsModel.fromJson(Map<String, dynamic> json) { 
    data = json['data'] != null ?  Data.fromJson(json['data']) : null; 
    message = json['message']; 
  } 
 
  Map<String, dynamic> toJson() { 
    final Map<String, dynamic> data = new Map<String, dynamic>(); 
    if (this.data != null) { 
      data['data'] = this.data!.toJson(); 
    } 
    data['message'] = message; 
    return data; 
  } 
} 
 
class Data { 
  String? phone; 
  String? updatedAt; 
  String? createdAt; 
  int? id; 
 
  Data({this.phone, this.updatedAt, this.createdAt, this.id}); 
 
  Data.fromJson(Map<String, dynamic> json) { 
    phone = json['phone']; 
    updatedAt = json['updated_at']; 
    createdAt = json['created_at']; 
    id = json['id']; 
  } 
 
  Map<String, dynamic> toJson() { 
    final data =  <String, dynamic>{}; 
    data['phone'] = phone; 
    data['updated_at'] = updatedAt; 
    data['created_at'] = createdAt; 
    data['id'] = id; 
    return data; 
  } 
}