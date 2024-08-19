class SignupRequestModel { 
  String? phone; 
  String? password; 
  String? passwordConfirmation; 
 
  SignupRequestModel({this.phone, this.password, this.passwordConfirmation}); 
 
  SignupRequestModel.fromJson(Map<String, dynamic> json) { 
    phone = json['phone']; 
    password = json['password']; 
    passwordConfirmation = json['password_confirmation']; 
  } 
 
  Map<String, dynamic> toJson() { 
    final  data =  <String, dynamic>{}; 
    data['phone'] = phone; 
    data['password'] = password; 
    data['password_confirmation'] = passwordConfirmation; 
    return data; 
  } 
}