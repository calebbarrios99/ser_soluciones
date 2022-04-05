import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Products extends HiveObject {
  Products(
      {this.id,
      required this.name,
      required this.brand,
      required this.reference,
      required this.quantity,
      required this.price,
      required this.description});
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? brand;
  @HiveField(3)
  String reference;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  int price;
  @HiveField(6)
  String? description;

  factory Products.fromJson(final json) {
    return Products(
        id: json['id'] ?? 1,
        name: json['name'],
        brand: json['brand'],
        reference: json['reference'],
        quantity: json['quantity'],
        price: json['price'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
  @override
  String toString() {
    return '${toJson()}';
  }
}
