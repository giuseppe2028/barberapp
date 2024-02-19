import 'package:barberapp/Widget/DisplayInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/Reservation.dart';
import '../Provider/data_provider.dart';
import '../Widget/ButtonStyle.dart';
import '../Widget/DialogWidget.dart';
import '../Widget/TextHeader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 17, top: 20, right: 17),
          child: Column(
            children: [
              _HeaderProfile(),
              const DisplayCardWidget(),
              ListaPrenotazioni(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.photo), label: "foto"),
      BottomNavigationBarItem(
          icon: Icon(Icons.add), label: "Aggiungi appuntamento"),
      BottomNavigationBarItem(icon: Icon(Icons.mail), label: "mail"),
    ]);
  }
}

class ListaPrenotazioni extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(pastReservationProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeader(testo: "Le tue vecchie prenotazioni"),
        Container(
            height: 300,
            child: data.when(
                data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "Giorno: ${data[index].reservationDate.day}-${data[index].reservationDate.month}-${data[index].reservationDate.year}"),
                            Text(
                                "Ora: ${data[index].reservationDate.hour.toString().padLeft(2, '0')}:${data[index].reservationDate.minute.toString().padLeft(2, '0')}"),
                            Text(
                                "Tipo Servizio: ${data[index].reservationType}")
                          ],
                        );
                      },
                    ),
                error: (err, s) => Text(err.toString()),
                loading: () => CircularProgressIndicator()))
      ],
    );
  }
}

class DisplayCardWidget extends ConsumerWidget {
  const DisplayCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _deletedElement =
        ref.watch(deleteReservationProvider).deleteNextReservation;
    final _nextReservation = ref.watch(nextReservationProvider);
    return loadData(_nextReservation, _deletedElement);
  }

  Widget loadData(
      AsyncValue<Reservation?> nextReservation, bool deletedElement) {
    return nextReservation.when(
        data: (nextReservation) {
          if (deletedElement == false && nextReservation != null) {
            //dati presenti
            return _CardWidget(nextReservation);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text("Nessuna Prenotazione Imminente",
                  style: TextStyle(fontSize: 17)),
            );
          }
        },
        error: (error, s) => Text("$error"),
        loading: () => const CircularProgressIndicator());
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
          padding: const EdgeInsets.only(left: 6),
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

// ignore: must_be_immutable
class _CardWidget extends ConsumerWidget {
  final Reservation? _data;
  const _CardWidget(this._data);
  @override
  Widget build(BuildContext context, ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 17, top: 10, right: 10),
        child: Column(
          children: [
            cardHeader(
                "${_data?.reservationDate.day} -${_data?.reservationDate.month}-${_data?.reservationDate.year}",
                _data!.reservationDate.hour.toString().padLeft(2, '0') +
                    ":" +
                    _data!.reservationDate.minute.toString().padLeft(2, '0'),
                _data!.reservationType),
            CardButton(_data!.idUtente, _data!.reservationDate)
          ],
        ),
      ),
    );
  }

//TODO da modificare
  Widget cardHeader(String reservationDay, String reservationHour,
      String tipoServizioOfferto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            DisplayInformation(text: "Giorno: $reservationDay"),
            DisplayInformation(text: "Ora: $reservationHour")
          ],
        ),
        DisplayInformation(text: "Tipo Servizio: $tipoServizioOfferto")
      ],
    );
  }
}

class CardButton extends ConsumerWidget {
  int idUtente;
  DateTime reservationDate;
  CardButton(this.idUtente, this.reservationDate, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: PersonalButton(
              text: 'Modifica Appuntamento',
              backgroundColor: const Color.fromARGB(255, 163, 155, 255),
              height: 35,
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => DialogWidget(),
              ),
            ),
          ),
          PersonalButton(
            text: 'Elimina',
            backgroundColor: Colors.red,
            width: 65,
            height: 35,
            onPressed: () {
              // ref.read(deleteDataReservationProvider.notifier).state = true;
              ref
                  .read(deleteReservationProvider)
                  .deleteReservation(idUtente, reservationDate);
            },
          ),
        ],
      ),
    );
  }
}
