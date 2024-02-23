import 'User.dart';
import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      User? user, 
      String? token, 
      num? expiresIn,}){
    _user = user;
    _token = token;
    _expiresIn = expiresIn;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _expiresIn = json['expires_in'];
  }
  User? _user;
  String? _token;
  num? _expiresIn;
Data copyWith({  User? user,
  String? token,
  num? expiresIn,
}) => Data(  user: user ?? _user,
  token: token ?? _token,
  expiresIn: expiresIn ?? _expiresIn,
);
  User? get user => _user;
  String? get token => _token;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['expires_in'] = _expiresIn;
    return map;
  }

}