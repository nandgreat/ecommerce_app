// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnotherFakeApiProduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnotherFakeApiProductAdapter extends TypeAdapter<AnotherFakeApiProduct> {
  @override
  final int typeId = 2;

  @override
  AnotherFakeApiProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnotherFakeApiProduct()
      .._id = fields[0] as num?
      .._title = fields[1] as String?
      .._price = fields[2] as num?
      .._description = fields[3] as String?
      .._images = (fields[4] as List?)?.cast<String>()
      .._creationAt = fields[5] as String?
      .._updatedAt = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, AnotherFakeApiProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._title)
      ..writeByte(2)
      ..write(obj._price)
      ..writeByte(3)
      ..write(obj._description)
      ..writeByte(4)
      ..write(obj._images)
      ..writeByte(5)
      ..write(obj._creationAt)
      ..writeByte(6)
      ..write(obj._updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnotherFakeApiProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnotherFakeApiProduct _$AnotherFakeApiProductFromJson(
        Map<String, dynamic> json) =>
    AnotherFakeApiProduct(
      id: json['id'] as num?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      creationAt: json['creationAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      category:
          json['category'] == null ? null : Category.fromJson(json['category']),
    );

Map<String, dynamic> _$AnotherFakeApiProductToJson(
        AnotherFakeApiProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
    };
