import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

AwesomeDialog successAlert({
  required BuildContext context,
  String? title,
  String? description,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: description,
    btnOkOnPress: () => {Get.back},
  )..show();
}
