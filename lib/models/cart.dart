import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class Cart extends HiveObject {
  Cart(
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

  factory Cart.fromJson(final json) {
    return Cart(
        name: json['name'],
        heart: json['heart'] ?? false,
        reference: json['reference'],
        quantity: json['quantity'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() => _$CartToJson(this);
  @override
  String toString() {
    return '${toJson()}';
  }
}
