// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['key'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      rating: json['rating'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'rating': instance.rating,
      'amount': instance.amount,
    };
