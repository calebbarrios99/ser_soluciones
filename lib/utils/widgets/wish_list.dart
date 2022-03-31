import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/cart.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const HiveData hiveData = HiveData();
    final _instance = Get.find<ProductsController>();

    return ListView.builder(
      itemBuilder: (context, index) {
        Products products = _instance.products[index];

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
            child: Icon(
              Icons.favorite,
              color: products.heart ? Colors.red : Colors.black,
              size: 30,
            ),
          )),
          onTap: () {
            heart(products, hiveData, index);

            _instance.update(['products']);
          },
        );
      },
      itemCount: _instance.products.length,
    );
  }

  void heart(Products products, HiveData hiveData, int index) {
    products.heart = products.heart ? false : true;
    hiveData.updateProduct(
        index,
        Products(
            name: products.name,
            heart: products.heart,
            reference: products.reference,
            quantity: products.quantity,
            price: products.price));

    products.heart
        ? hiveData.saveCart(Cart(
            name: products.name,
            heart: products.heart,
            reference: products.reference,
            quantity: products.quantity,
            price: products.price))
        : null;
  }
}
