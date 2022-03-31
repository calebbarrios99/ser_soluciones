import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/cart_controller.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const HiveData hiveData = HiveData();
    final _instance = Get.find<CartController>();

    return ListView.builder(
      itemBuilder: (context, index) {
        final products = _instance.cart[index];

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
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color.fromRGBO(255, 255, 255, 0.60)),
            child: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 30,
            ),
          )),
          onTap: () {
            delete(hiveData, index);
            Get.find<CartController>().onInit();
          },
        );
      },
      itemCount: _instance.cart.length,
    );
  }

  void delete(HiveData hiveData, int index) {
    hiveData.deleteCart(
      index,
    );
  }
}
