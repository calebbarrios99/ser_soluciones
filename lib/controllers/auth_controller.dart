import 'dart:convert';

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

    await getToken();
    retrieveUser();
  }

  Future<void> getToken() async {
    APIClient apiClient;
    final dio = Dio();

    apiClient =
        APIClient(dio, contentType: 'application/x-www-form-urlencoded');

    final response = await apiClient.login({
      'client_id': 'any_client',
      'client_secret': '554a979c-41f4-45da-899c-e209c673ab80',
      'grant_type': 'client_credentials'
    });
    logger.d(response);
    MyPreferences.saveAuth(response.accessToken.toString());
  }

  void retrieveUser() async {
    final token = await MyPreferences.getDynamic(key: USER_INFORMATION);

    setUser(token);
    update();
  }

  void setUser(value) {
    user.accessToken = value;

    logger.d('prueba', user.accessToken);
  }
}
