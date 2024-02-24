
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());

@JsonSerializable()
@HiveType(typeId: 2)
class Products {
  Products({
    num? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,}){
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _discountPercentage = discountPercentage;
    _rating = rating;
    _stock = stock;
    _brand = brand;
    _category = category;
    _thumbnail = thumbnail;
    _images = images;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'];
    _stock = json['stock'];
    _brand = json['brand'];
    _category = json['category'];
    _thumbnail = json['thumbnail'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  @HiveField(0)
  num? _id;

  @HiveField(1)
  String? _title;

  @HiveField(2)
  String? _description;

  @HiveField(3)
  num? _price;

  @HiveField(4)
  num? _discountPercentage;

  @HiveField(5)
  num? _rating;

  @HiveField(6)
  num? _stock;

  @HiveField(7)
  String? _brand;

  @HiveField(8)
  String? _category;

  @HiveField(9)
  String? _thumbnail;

  List<String>? _images;
  Products copyWith({  num? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) => Products(  id: id ?? _id,
    title: title ?? _title,
    description: description ?? _description,
    price: price ?? _price,
    discountPercentage: discountPercentage ?? _discountPercentage,
    rating: rating ?? _rating,
    stock: stock ?? _stock,
    brand: brand ?? _brand,
    category: category ?? _category,
    thumbnail: thumbnail ?? _thumbnail,
    images: images ?? _images,
  );
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  num? get price => _price;
  num? get discountPercentage => _discountPercentage;
  num? get rating => _rating;
  num? get stock => _stock;
  String? get brand => _brand;
  String? get category => _category;
  String? get thumbnail => _thumbnail;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['rating'] = _rating;
    map['stock'] = _stock;
    map['brand'] = _brand;
    map['category'] = _category;
    map['thumbnail'] = _thumbnail;
    map['images'] = _images;
    return map;
  }

}