// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/widgets/wish_list.dart';
import 'package:ser_soluciones/utils/widgets/onwillPop.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomepageState();
}

class _HomepageState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: GetBuilder<ProductsController>(
        id: 'products',
        builder: (_) {
          return Scaffold(
            appBar: MyAppBar(
              titleText: "Ser Soluciones",
              context: context,
            ),
            body: WishList(),
          );
        },
      ),
    );
  }
}
