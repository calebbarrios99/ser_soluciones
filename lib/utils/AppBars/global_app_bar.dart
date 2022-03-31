import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ser_soluciones/services/routes/app_pages.dart';
import 'package:ser_soluciones/utils/constans.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    required this.titleText,
    required this.context,
    this.returningValue,
  });

  final String titleText;
  final dynamic returningValue;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Abrir carrito',
          onPressed: () {
            Get.toNamed(Routes.CART);
          },
        )
      ],
      backgroundColor: kDarkBlueMainColor,
      title: Text(
        titleText,
        style: const TextStyle(fontSize: 15),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
