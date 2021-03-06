import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:ser_soluciones/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_INFORMATION = 'user_information';
const String PRODUCTS_INFORMATION = 'products_information';
const String CART_INFORMATION = 'cart_information';

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

  static saveAuth(String user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_INFORMATION, user);

    // Logger().d('saveAuth -> ${user.toString()}');
  }

  static Future<dynamic> getDynamic({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
