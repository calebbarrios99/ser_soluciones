import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/controllers/auth_controller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/services/api/APIClient.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';

class ProductsController extends GetxController {
  List<Products> _products = <Products>[].obs;
  List<Products> get products => _products;
  set products(value) => _products = value;
  final looger = Logger();
  static const HiveData hiveData = HiveData();
  bool _loading = true;
  get loading => _loading;
  @override
  Future<void> onInit() async {
    super.onInit();
    final instance = Get.find<AuthController>();
    final dio = Dio();

    try {
      final apiClient = APIClient(dio, token: instance.user.accessToken);

      final response = await apiClient.getProducts();
      //products = response;

      final productHive = await hiveData.products;

      if (productHive.isEmpty) {
        for (var i = 0; i < response.length; i++) {
          hiveData.saveProduct(response[i]);
          looger.d(response[i]);
        }
      }

      _products = await hiveData.products;

      looger.d(_products);
    } on Exception catch (e) {
      _products = await hiveData.products;

      looger.d(e);
    }
    update(['products']);
    _loading = false;

    // pr
  }

  /*void setProductModel() async {
    final products = await hiveData.products;
    looger.d(products);
    setProductM(products);
    update(['products']);
  }

  void setProductM(value) {
    _products = value;
  }*/
}
