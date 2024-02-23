import 'package:ecommerce_app/data/db/local_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';


@JsonSerializable()
class Product extends LocalEntity {
  Product(super.key, {
      required this.title,
      required this.image,
      required this.description,
      required this.rating,
      required this.amount,});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  String title;
  String image;
  String description;
  String rating;
  String amount;

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}