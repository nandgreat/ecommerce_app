// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 2;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products()
      .._id = fields[0] as num?
      .._title = fields[1] as String?
      .._description = fields[2] as String?
      .._price = fields[3] as num?
      .._discountPercentage = fields[4] as num?
      .._rating = fields[5] as num?
      .._stock = fields[6] as num?
      .._brand = fields[7] as String?
      .._category = fields[8] as String?
      .._thumbnail = fields[9] as String?;
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._title)
      ..writeByte(2)
      ..write(obj._description)
      ..writeByte(3)
      ..write(obj._price)
      ..writeByte(4)
      ..write(obj._discountPercentage)
      ..writeByte(5)
      ..write(obj._rating)
      ..writeByte(6)
      ..write(obj._stock)
      ..writeByte(7)
      ..write(obj._brand)
      ..writeByte(8)
      ..write(obj._category)
      ..writeByte(9)
      ..write(obj._thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: json['id'] as num?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      discountPercentage: json['discountPercentage'] as num?,
      rating: json['rating'] as num?,
      stock: json['stock'] as num?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
