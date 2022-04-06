import 'package:flutter/material.dart';
import 'package:ser_soluciones/utils/constans.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  RoundButton({Key? key, required this.onPress, required this.text})
      : super(key: key);

  VoidCallback onPress;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(Icons.save),
        label: Text(text),
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.white,
          backgroundColor: kYellowMainColor,
          side: const BorderSide(color: Colors.deepOrange, width: 0.1),
          elevation: 20,
        ),
        onPressed: onPress);
  }
}
