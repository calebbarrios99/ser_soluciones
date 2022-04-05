import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';

class Cart_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          titleText: "Ser Soluciones",
          context: context,
          icon: false,
        ),
        body: SafeArea(child: Text('Card_Viewroller')));
  }
}
