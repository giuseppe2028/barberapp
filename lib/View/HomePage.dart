import 'package:barberapp/Widget/DisplayInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/data_provider.dart';
import '../Widget/ButtonStyle.dart';
import '../Widget/TextHeader.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 17, top: 20, right: 17),
          child: Column(
            children: [_HeaderProfile(), _CardWidget(), listaPrenotazioni()],
          ),
        ),
      ),
    );
  }

  Widget listaPrenotazioni() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [TextHeader(testo: "Le tue vecchie prenotazioni"), Container()],
    );
  }
}

class _HeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(),
        Container(
          padding: EdgeInsets.only(left: 6),
          child: Column(
            children: [
              TextHeader(testo: "Benvenuto,"),
              //TODO mettere il nome dell'utente
              TextHeader(testo: "Giuseppe"),
            ],
          ),
        ),
      ],
    );
  }
}

class _CardWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(lastDataReservationProvider);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          padding: EdgeInsets.only(left: 17, top: 10, right: 10),
          child: _data.when(
              data: (_data) {
                return Column(
                  children: [
                    cardHeader(
                        "${_data.reservationDate.day} -${_data.reservationDate.month}-${_data.reservationDate.year}",
                        _data.reservationTime),
                    cardButton()
                  ],
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => CircularProgressIndicator())),
    );
  }

//TODO da modificare
  Widget cardHeader(String reservationDay, String reservationHour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DisplayInformation(text: "Giorno: $reservationDay"),
            DisplayInformation(text: "Ora: $reservationHour")
          ],
        ),
        DisplayInformation(text: "Tipo Servizio: Taglio")
      ],
    );
  }

  Widget cardButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PersonalButton(
              text: 'Modifica Appuntamento',
              backgroundColor: Color.fromARGB(255, 163, 155, 255),
              height: 35,
            ),
          ),
          PersonalButton(
            text: 'Elimina',
            backgroundColor: Colors.red,
            width: 65,
            height: 35,
          ),
        ],
      ),
    );
  }
}
