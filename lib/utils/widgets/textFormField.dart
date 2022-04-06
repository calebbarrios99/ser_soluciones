import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(this.value, this.hintText, this.formKey, {Key? key})
      : super(key: key);

  String value;
  String hintText;
  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Campo Requerido' : null,
      onSaved: (newValue) => value = newValue.toString(),
      key: formKey,
      style: const TextStyle(
        fontSize: 18,
        height: 1.5,
        color: Colors.white,
      ),
      autofocus: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
