// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/cart_controller.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/widgets/cart_list.dart';

class Card_view extends StatefulWidget {
  const Card_view({Key? key}) : super(key: key);

  @override
  State<Card_view> createState() => _Card_viewState();
}

class _Card_viewState extends State<Card_view> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Carrito",
                style: TextStyle(fontSize: 15),
              ),
              backgroundColor: kDarkBlueMainColor,
              centerTitle: true,
            ),
            body: CartList());
      },
    );
  }
}
