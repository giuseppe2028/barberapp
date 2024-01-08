import 'package:flutter/cupertino.dart';

class TextHeader extends StatelessWidget {
  String testo;
  TextHeader({required this.testo});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$testo",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
