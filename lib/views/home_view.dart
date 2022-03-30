// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
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
      child: Scaffold(
          appBar: GlobalAppBar(
            titleText: "Ser Soluciones",
            context: context,
          ),
          body: const SafeArea(child: const Text("hola"))),
    );
  }
}
