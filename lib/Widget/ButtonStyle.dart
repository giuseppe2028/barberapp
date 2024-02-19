import 'package:flutter/material.dart';

class PersonalButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  double? width, height;
  VoidCallback? onPressed;
  PersonalButton(
      {required this.text,
      required this.backgroundColor,
      this.width,
      this.height,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 13)),
      ),
    );
  }
}
