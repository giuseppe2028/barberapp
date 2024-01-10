import 'package:flutter/material.dart';

class ButtonStyle extends StatelessWidget {
  String text;
  Color backgroundColor;
  ButtonStyle({required this.text, required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
