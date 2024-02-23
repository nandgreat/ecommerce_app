import 'Location.dart';
import 'Contacts.dart';
import 'dart:convert';

Campus campusFromJson(String str) => Campus.fromJson(json.decode(str));
String campusToJson(Campus data) => json.encode(data.toJson());
class Campus {
  Campus({
      Location? location, 
      List<String>? images, 
      String? id, 
      num? v, 
      List<Contacts>? contacts, 
      String? createdAt, 
      String? name, 
      String? updatedAt
  }){
    _location = location;
    _images = images;
    _id = id;
    _v = v;
    _contacts = contacts;
    _createdAt = createdAt;
    _name = name;
    _updatedAt = updatedAt;
    _id = id;
}

  Campus.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _id = json['_id'];
    _v = json['__v'];
    if (json['contacts'] != null) {
      _contacts = [];
      json['contacts'].forEach((v) {
        _contacts?.add(Contacts.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _name = json['name'];
    _updatedAt = json['updatedAt'];
    _id = json['id'];
  }
  Location? _location;
  List<String>? _images;
  String? _id;
  num? _v;
  List<Contacts>? _contacts;
  String? _createdAt;
  String? _name;
  String? _updatedAt;
Campus copyWith({  Location? location,
  List<String>? images,
  String? id,
  num? v,
  List<Contacts>? contacts,
  String? createdAt,
  String? name,
  String? updatedAt,
}) => Campus(  location: location ?? _location,
  images: images ?? _images,
  id: id ?? _id,
  v: v ?? _v,
  contacts: contacts ?? _contacts,
  createdAt: createdAt ?? _createdAt,
  name: name ?? _name,
  updatedAt: updatedAt ?? _updatedAt,
);
  Location? get location => _location;
  List<String>? get images => _images;
  String? get id => _id;
  num? get v => _v;
  List<Contacts>? get contacts => _contacts;
  String? get createdAt => _createdAt;
  String? get name => _name;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['images'] = _images;
    map['_id'] = _id;
    map['__v'] = _v;
    if (_contacts != null) {
      map['contacts'] = _contacts?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['updatedAt'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}