// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 1;

  @override
  CartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItem(
      title: fields[0] as String?,
      image: fields[1] as String?,
      description: fields[2] as String?,
      rating: fields[3] as double?,
      amount: fields[4] as int?,
      quantity: fields[5] as int?,
      totalAmount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.totalAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
