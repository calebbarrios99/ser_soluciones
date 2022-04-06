import 'package:get/get.dart';
import 'package:ser_soluciones/views/cart_view.dart';
import 'package:ser_soluciones/views/home_view.dart';
import 'package:ser_soluciones/views/product_detail.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const Homeview(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => Cart_View(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => ProductDetailView(0),
    )
  ];
}
