// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/cart.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:ser_soluciones/utils/widgets/wish_list.dart';
import 'package:ser_soluciones/utils/widgets/onwillPop.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomepageState();
}

class _HomepageState extends State<Homeview> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String brand = '';
  String reference = '';
  int quantity = 0;
  int price = 0;
  String description = '';

  HiveData hiveData = const HiveData();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: GetBuilder<ProductsController>(
        init: ProductsController(),
        id: 'products',
        builder: (_) {
          return Scaffold(
            appBar: MyAppBar(
              titleText: "Ser Soluciones",
              context: context,
            ),
            body: WishList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                addDialog(context, _);
              },
              backgroundColor: kYellowMainColor,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> addDialog(
      BuildContext context, ProductsController productsController) {
    return showDialog(
      builder: (context) => SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        backgroundColor: kDarkBlueMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            const Text(
              "Agregar Producto",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.cancel,
                color: kYellowMainColor,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        children: [
          //const SizedBox(height: 5.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) => name = newValue.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Nombre",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) => brand = newValue.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Marca",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) => reference = newValue.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Referencia",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) =>
                      quantity = int.parse(newValue.toString()),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Cantidad",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) => description = newValue.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Descripción",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Campo Requerido' : null,
                  onSaved: (newValue) => price = int.parse(newValue.toString()),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Precio",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: null,
            height: 50,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Agregar"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();

                  productsController.createProducts(Products(
                      name: name.toString(),
                      brand: brand.toString(),
                      reference: reference.toString(),
                      quantity: quantity.toInt(),
                      price: price.toInt(),
                      description: description.toString()));
                  Get.back();
                }
              },
            ),
          )
        ],
      ),
      context: context,
    );
  }
}
