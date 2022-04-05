import 'package:get/get.dart';
import 'package:ser_soluciones/models/products.dart';

class ProductDetailController extends GetxController {
  late Products _productsDetail;
  Products get productsDetail => _productsDetail;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _productsDetail = Get.arguments as Products;
  }
}
