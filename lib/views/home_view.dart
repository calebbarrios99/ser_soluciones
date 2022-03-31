// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/MyPreferences.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:ser_soluciones/utils/widgets/onwillPop.dart';
import 'package:logger/logger.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomepageState();
}

class _HomepageState extends State<Homeview> {
  final _instance = Get.find<ProductsController>();

  final logger = Logger();
  static const HiveData hiveData = HiveData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: GetBuilder<ProductsController>(
        id: 'products',
        builder: (_) {
          return Scaffold(
            appBar: GlobalAppBar(
              titleText: "Ser Soluciones",
              context: context,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                final Products products = _.products[index];

                return ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.amber,
                  ),
                  title: Text(' ${products.name}',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('Precio: ${products.price} ',
                      style: TextStyle(
                          color: Colors.amber[200],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  trailing: GestureDetector(
                      child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Color.fromRGBO(255, 255, 255, 0.60)),
                    child: Icon(
                      Icons.favorite,
                      color: products.heart ? Colors.red : Colors.black,
                      size: 30,
                    ),
                  )),
                  onTap: () {
                    products.heart = true;
                    hiveData.updateProduct(
                        index,
                        Products(
                            name: products.name,
                            heart: products.heart,
                            reference: products.reference,
                            quantity: products.quantity,
                            price: products.price));

                    _instance.update(['products']);
                  },
                );
              },
              itemCount: _.products.length,
            ),
          );
        },
      ),
    );
  }
}
