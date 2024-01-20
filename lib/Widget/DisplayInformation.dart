import 'package:flutter/cupertino.dart';

class DisplayInformation extends StatelessWidget {
  String text;
  DisplayInformation({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
    );
  }
}
