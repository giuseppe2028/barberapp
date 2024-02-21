import 'package:flutter/material.dart';

class TextFieldPersonal extends StatelessWidget {
  String label;
  TextEditingController? controller;
  TextFieldPersonal({required this.label, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: label,
      ),
    );
  }
}
