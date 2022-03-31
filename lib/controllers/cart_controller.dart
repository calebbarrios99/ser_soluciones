import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/cart.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:logger/logger.dart';

class CartController extends GetxController {
  static const HiveData hiveData = HiveData();
  final looger = Logger();
  List<Cart> _cart = <Cart>[].obs;
  List<Cart> get cart => _cart;
  set products(value) => _cart = value;

  final instance = Get.find<ProductsController>();

  @override
  void onClose() {
    super.onClose();
    instance.onInit();
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    final cartHive = await hiveData.cart;

    _cart = cartHive;
    looger.d(_cart);
    update();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    //
  }
}
