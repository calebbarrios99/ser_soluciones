import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AwesomeDialog errorAlert(
    {required BuildContext context,
    String? title,
    String? desc,
    Function? function}) {
  return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: function ?? () => {Get.back},
      btnOkColor: Colors.red)
    ..show();
}
