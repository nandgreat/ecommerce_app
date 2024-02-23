class SignupRequest {
  SignupRequest({
      this.fullName,
      this.country,
      this.username, 
      this.email, 
      this.password,
      this.isVendor,
  });

  SignupRequest.fromJson(dynamic json) {
    fullName = json['fullname'];
    country = json['country'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }
  String? fullName;
  String? country;
  String? username;
  String? email;
  String? password;
  bool? isVendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = fullName;
    map['country'] = country;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['isVendor'] = isVendor;
    return map;
  }

}