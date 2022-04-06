// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:ser_soluciones/utils/widgets/add_modal.dart';
import 'package:ser_soluciones/utils/widgets/wish_list.dart';
import 'package:ser_soluciones/utils/widgets/onwillPop.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomepageState();
}

class _HomepageState extends State<Homeview> {
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
              icon: true,
            ),
            body: WishList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await addDialog(context, _);
              },
              backgroundColor: kYellowMainColor,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
