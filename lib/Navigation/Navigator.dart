import 'package:flutter/material.dart';

class NavigatorService {
  static goTo(Widget classToGo, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => classToGo,
      ),
    );
  }
}
