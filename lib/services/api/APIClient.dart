import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/models/user.dart';
import 'package:ser_soluciones/services/api/endpoints.dart';

part 'APIClient.g.dart';

@RestApi(baseUrl: MAIN)
abstract class APIClient {
  factory APIClient(Dio dio, {String? baseUrl, String? token}) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 200));
    dio.options = BaseOptions(
      receiveTimeout: 20000,
      connectTimeout: 20000,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    return _APIClient(dio, baseUrl: baseUrl);
  }

  @POST('/connect/token')
  Future<User> login(@Body() Map<String, String> body);

  @GET('/api/Producto')
  Future<List<Products>> getProducts();
}
