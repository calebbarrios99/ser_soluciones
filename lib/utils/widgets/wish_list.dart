import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/cart.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/utils/widgets/slide_to_act_dialog.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const HiveData hiveData = HiveData();
    final logger = Logger();
    final _instance = Get.find<ProductsController>();

    return ListView.builder(
      itemBuilder: (context, index) {
        Products products = _instance.products[index];

        return InkWell(
          onLongPress: () {
            logger.d(products.id);
            createSlideDialog(
                context: context, productId: products.id!, index: index);
          },
          child: ListTile(
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
            onTap: () {},
          ),
        );
      },
      itemCount: _instance.products.length,
    );
  }
}
