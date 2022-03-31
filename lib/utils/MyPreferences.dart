import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_INFORMATION = 'user_information';
const String PRODUCTS_INFORMATION = 'products_information';

class MyPreferences {
  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var userInfo = prefs.getString(USER_INFORMATION);
    Logger().d('Json -> ${jsonEncode(userInfo)}');
    if (userInfo != null) {
      return User.fromPreferences(jsonDecode(userInfo));
    } else {
      return User.fromJson(json);
    }
  }

  /*Future<Products> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var productInfo = prefs.getString(PRODUCTS_INFORMATION);
    Logger().d('Json encode -> ${jsonEncode(productInfo)}');
    if (productInfo != null) {
      return Products.fromJson(jsonDecode(productInfo));
    } else {
      return Products.fromJson(json);
    }
  }*/

  static saveAuth(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_INFORMATION, jsonEncode(user.toJson()));

    Logger().d('saveAuth -> ${user.toJson()}');
  }

  /*static saveProducts(List<Products> products) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PRODUCTS_INFORMATION, jsonEncode(products));

    Logger().d('saveProducts -> ${products}');
  }*/

  static Future<dynamic> getDynamic({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
