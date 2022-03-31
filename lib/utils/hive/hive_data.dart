import 'package:hive_flutter/adapters.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';

class HiveData {
  const HiveData();

  Future<int> saveProduct(Products products) async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.add(products);
  }

  updateProduct(int index, Products products) async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.put(index, products);
  }

  Future<List<Products>> get products async {
    final Box<Products> box =
        await Hive.openBox<Products>(PRODUCTS_INFORMATION);
    return box.values.toList();
  }
}
