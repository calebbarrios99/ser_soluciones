import 'package:flutter/material.dart';

Future<bool> onWillPop(BuildContext context) async {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.red);
  final ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.green);
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¡Alerta!'),
      content: const Text('¿Esta seguro que desea salir?'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: style,
          child: const Text('No'),
        ),
        ElevatedButton(
          style: style2,
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
      ],
    ),
  );

  return shouldPop ?? false;
}
