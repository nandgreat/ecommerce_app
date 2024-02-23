import 'dart:convert';

Contacts contactsFromJson(String str) => Contacts.fromJson(json.decode(str));
String contactsToJson(Contacts data) => json.encode(data.toJson());
class Contacts {
  Contacts({
      String? id, 
      String? name, 
      String? phone,}){
    _id = id;
    _name = name;
    _phone = phone;
}

  Contacts.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _phone = json['phone'];
  }
  String? _id;
  String? _name;
  String? _phone;
Contacts copyWith({  String? id,
  String? name,
  String? phone,
}) => Contacts(  id: id ?? _id,
  name: name ?? _name,
  phone: phone ?? _phone,
);
  String? get id => _id;
  String? get name => _name;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    return map;
  }

}