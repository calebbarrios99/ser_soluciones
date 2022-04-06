import 'package:ser_soluciones/models/products.dart';

import 'package:intl/intl.dart';
import 'dart:io';

class Utils {
  static String getCartTotal(List<Products> products) {
    double total = 0;
    for (var product in products) {
      total += product.price * product.select;
    }
    return Utils.getCurrency(total.toInt().toString());
  }

  static String getCurrency(String value) {
    final formatter = NumberFormat("#,###", "en_US");
    return formatter.format(num.parse(value));
  }
}
