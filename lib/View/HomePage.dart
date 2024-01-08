import 'package:flutter/material.dart';

import '../Widget/TextHeader.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}

class _HeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            TextHeader(testo: "Benvenuto,"),
            //TODO mettere il nome dell'utente
            TextHeader(testo: "Giuseppe"),
          ],
        ),
        CircleAvatar(),
      ],
    );
  }
}
