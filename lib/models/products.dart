import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Products extends HiveObject {
  Products(
      {required this.name,
      required this.heart,
      required this.reference,
      required this.quantity,
      required this.price});

  @HiveField(0)
  String name;
  @HiveField(1)
  bool heart = false;
  @HiveField(2)
  String reference;
  @HiveField(3)
  int quantity;
  @HiveField(4)
  int price;

  factory Products.fromJson(final json) {
    return Products(
        name: json['name'],
        heart: json['heart'] ?? false,
        reference: json['reference'],
        quantity: json['quantity'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
  @override
  String toString() {
    return '${toJson()}';
  }
}
