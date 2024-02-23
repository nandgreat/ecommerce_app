class LoginRequest {
  LoginRequest({
      this.id, 
      this.password, 
      this.deviceToken,});

  LoginRequest.fromJson(dynamic json) {
    id = json['id'];
    password = json['password'];
    deviceToken = json['device_token'];
  }
  String? id;
  String? password;
  String? deviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['password'] = password;
    map['device_token'] = deviceToken;
    return map;
  }

}