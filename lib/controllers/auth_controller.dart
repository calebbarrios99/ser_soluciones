import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/models/user.dart';
import 'package:ser_soluciones/services/api/APIClient.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';

class AuthController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    final logger = Logger();
    APIClient apiClient;
    final dio = Dio();

    apiClient = APIClient(dio);

    User response = await apiClient.login({
      'client_id': 'any_client',
      'client_secret': '554a979c-41f4-45da-899c-e209c673ab80',
      'grant_type': 'client_credentials'
    });
    MyPreferences.saveAuth(response);
    logger.d(response);
  }
}
