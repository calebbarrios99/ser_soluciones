import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/auth_controller.dart';

class GlobalBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
