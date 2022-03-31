// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 0;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      name: fields[0] as String,
      heart: fields[1] as bool,
      reference: fields[2] as String,
      quantity: fields[3] as int,
      price: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.heart)
      ..writeByte(2)
      ..write(obj.reference)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.price);
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
      name: json['name'] as String,
      heart: json['heart'] as bool,
      reference: json['reference'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'name': instance.name,
      'heart': instance.heart,
      'reference': instance.reference,
      'quantity': instance.quantity,
      'price': instance.price,
    };
