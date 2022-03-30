import 'package:flutter/material.dart';
import 'package:ser_soluciones/utils/constans.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
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
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
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
