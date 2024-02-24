import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AnotherFakeApiProduct.g.dart';

AnotherFakeApiProduct anotherFakeApiProductFromJson(String str) => AnotherFakeApiProduct.fromJson(json.decode(str));
String anotherFakeApiProductToJson(AnotherFakeApiProduct data) => json.encode(data.toJson());

@JsonSerializable()
@HiveType(typeId: 2)
class AnotherFakeApiProduct {
  AnotherFakeApiProduct({
      num? id, 
      String? title, 
      num? price, 
      String? description, 
      List<String>? images, 
      String? creationAt, 
      String? updatedAt, 
      Category? category,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _images = images;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
    _category = category;
}

  AnotherFakeApiProduct.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  @HiveField(0)
  num? _id;

  @HiveField(1)
  String? _title;

  @HiveField(2)
  num? _price;

  @HiveField(3)
  String? _description;

  @HiveField(4)
  dynamic _images;

  @HiveField(5)
  String? _creationAt;

  @HiveField(6)
  String? _updatedAt;

  Category? _category;
AnotherFakeApiProduct copyWith({  num? id,
  String? title,
  num? price,
  String? description,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
  Category? category,
}) => AnotherFakeApiProduct(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  description: description ?? _description,
  images: images ?? _images,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
  category: category ?? _category,
);
  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  String? get description => _description;
  dynamic get images => _images;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['images'] = _images;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      num? id, 
      String? name, 
      String? image, 
      String? creationAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _creationAt;
  String? _updatedAt;
Category copyWith({  num? id,
  String? name,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}