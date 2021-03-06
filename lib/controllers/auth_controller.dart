import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/user.dart';
import 'package:ser_soluciones/services/api/APIClient.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';

class AuthController extends GetxController {
  Rx<User> _userModel = User().obs;

  User get user => _userModel.value;

  set user(User value) => _userModel.value = value;
  final logger = Logger();

  @override
  Future<void> onInit() async {
    super.onInit();
    //  getToken();
  }

  Future<void> getToken() async {
    APIClient apiClient;
    final dio = Dio();

    try {
      apiClient =
          APIClient(dio, contentType: 'application/x-www-form-urlencoded');

      final response = await apiClient.login({
        'client_id': 'any_client',
        'client_secret': '554a979c-41f4-45da-899c-e209c673ab80',
        'grant_type': 'client_credentials'
      });
      if (response.accessToken != null) {
        await MyPreferences.saveAuth(response.accessToken.toString());
      }

      await retrieveUser();
    } on DioError catch (e) {
      await retrieveUser();
    }
  }

  Future<void> retrieveUser() async {
    final token = await MyPreferences.getDynamic(key: USER_INFORMATION);
    logger.d('este', token);
    await setUser(token);
    return setUser(token);
  }

  Future<void> setUser(value) async {
    user.accessToken = value;

    //logger.d('prueba', user.accessToken);
  }
}
