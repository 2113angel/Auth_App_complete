import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.validator,


  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}