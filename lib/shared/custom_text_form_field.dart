import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key, required this.controller, this.validator, this.textLabel});

  final String? textLabel;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: textLabel,
      ),
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.text,
    );
  }
}
