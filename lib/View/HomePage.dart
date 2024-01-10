import 'package:barberapp/Widget/DisplayInformation.dart';
import 'package:flutter/material.dart';

import '../Widget/TextHeader.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [_HeaderProfile()],
        ),
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

class _CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          cardHeader(),
          Widget cardButton()
        ],
      ),
    );
  }

  Widget cardHeader() {
    return Row(
      children: [
        Column(
          children: [
            DisplayInformation(text: "Giorno: 08-01-2024"),
            DisplayInformation(text: "Ora: 19:30")
          ],
        ),
        DisplayInformation(text: "Tipo Servizio: Taglio")
      ],
    );
  }

  Widget cardButton() {
    return Row(
      children: [

      ],
    );
  }
}
