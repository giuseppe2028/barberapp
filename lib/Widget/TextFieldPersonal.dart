import 'package:flutter/material.dart';

class TextFieldPersonal extends StatelessWidget {
  String label;
  TextFieldPersonal({required this.label});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
