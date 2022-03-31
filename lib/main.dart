import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ser_soluciones/bindings/global_binding.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/services/routes/app_pages.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsAdapter());
  //await Hive.openBox<Products>(USER_INFORMATION);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      initialRoute: Routes.HOMEPAGE,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
