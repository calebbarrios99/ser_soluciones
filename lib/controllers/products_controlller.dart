import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/controllers/auth_controller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/services/api/APIClient.dart';
import 'package:ser_soluciones/services/routes/app_pages.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:ser_soluciones/views/product_detail.dart';

class ProductsController extends GetxController {
  /*  PRODUCTS  */
  List<Products> _products = <Products>[].obs;

  List<Products> get products => _products.obs;
  set products(value) => _products = value;

  /* API*/
  final auth = Get.find<AuthController>().user;
  late Dio dio = Dio();
  late APIClient apiClient = ApiClient();
  final Logger logger = Logger();

  static const HiveData hiveData = HiveData();

  /* LOADING  */
  bool _loading = true;
  get loading => _loading;

  @override
  Future<void> onInit() async {
    super.onInit();

    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final response = await apiClient.getProducts();

      final productHive = await hiveData.products;

      if (productHive.isEmpty) {
        for (var i = 0; i < response.length; i++) {
          hiveData.saveProduct(response[i]);
          logger.d(response[i]);
        }
      }

      await updateProductsModel();
    } on Exception catch (e) {
      products = await hiveData.products;

      logger.d(e);
    }

    _loading = false;

    // pr
  }

  Future<void> updateProductsModel() async {
    _products = await hiveData.products;

    update(['products']);
  }

  Future<void> deleteProducts(int productId) async {
    ApiClient();
    try {
      await apiClient.deleteProducts(productId);
    } on DioError catch (e) {
      logger.d(e);
    }
  }

  Future<void> createProducts(Products products) async {
    ApiClient();

    final body = {
      "id": 0,
      "name": products.name,
      "brand": products.brand,
      "reference": products.reference,
      "quantity": products.quantity,
      "price": products.price,
      "description": products.description
    };

    try {
      final response = await apiClient.createProducts(body);
      hiveData.saveProduct(response);
    } on DioError catch (e) {
      logger.d(e);
    }
    updateProductsModel();
  }

  Future<void> UpdateProducts(Products products, int index) async {
    ApiClient();
    logger.d(index);
    final body = {
      "id": 0,
      "name": products.name,
      "brand": products.brand,
      "reference": products.reference,
      "quantity": products.quantity,
      "price": products.price,
      "description": products.description
    };

    try {
      await apiClient.editProducts(body, products.id.toString());
      hiveData.updateProduct(index, products);
    } on DioError catch (e) {
      logger.d(e);
    }
    updateProductsModel();
  }

  productDetail(Products products, int index) {
    Get.to(ProductDetailView(index), arguments: products);
  }

  goCart(List<Products> products) {
    Get.toNamed(Routes.CART, arguments: products);
  }

  APIClient ApiClient() {
    apiClient = APIClient(dio,
        contentType: 'application/json',
        token: Get.find<AuthController>().user.accessToken.toString());
    return apiClient;
  }

  increment() {}
}
