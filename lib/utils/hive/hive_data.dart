import 'package:hive_flutter/adapters.dart';
import 'package:ser_soluciones/models/cart.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';

class HiveData {
  const HiveData();

  Future<int> saveProduct(Products products) async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.add(products);
  }

  Future<int> saveCart(Cart cart) async {
    final Box<Cart> box = await Hive.openBox<Cart>(CART_INFORMATION);
    return box.add(cart);
  }

  updateProduct(int index, Products products) async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.put(index, products);
  }

  deleteProduct(int index) async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.delete(index);
  }

  deleteCart(int index) async {
    final Box<Cart> box = await Hive.openBox<Cart>(CART_INFORMATION);
    return box.deleteAt(index);
  }

  Future<List<Products>> get products async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.values.toList();
  }

  Future<List<Cart>> get cart async {
    final Box<Cart> box = await Hive.openBox<Cart>(CART_INFORMATION);
    return box.values.toList();
  }
}
