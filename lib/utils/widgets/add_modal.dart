import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/widgets/textFormField.dart';

final _formKey = GlobalKey<FormState>();
String name = '';
String brand = '';
String reference = '';
int quantity = 0;
int price = 0;
String description = '';
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
            onPressed: () => Get.back(),
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
                validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
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
            width: 20,
            height: 40,
            child: TextButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Guardar"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: kYellowMainColor,
                side: const BorderSide(color: Colors.deepOrange, width: 0.1),
                elevation: 20,
              ),
              onPressed: () {
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
            ))
      ],
    ),
    context: context,
  );
}
