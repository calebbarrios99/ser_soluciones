import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/auth_controller.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<ProductsController>(ProductsController(), permanent: true);
  }
}
