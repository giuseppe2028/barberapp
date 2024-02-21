import 'package:barberapp/Provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'CustomDatePicker.dart';

class DialogWidget extends ConsumerWidget {
  late DateTime finalData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime? dateTime;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
              onDateChanged: (DateTime value) async {
                finalData = value;
                //creo un provider di tipo colore, e gli dico di cambiare colore se la soglia di prenotazioni in quella data supera 3
                ref.read(dateTimeProvider.notifier).state = value;
                print(
                    "lo stato : ${ref.read(dateTimeProvider.notifier).state}");
                final data = ref.watch(reservationAviableProvider);
              },
              selectableDayPredicate: (DateTime val) =>
                  val.weekday == 6 || val.weekday == 7 ? false : true,
            ),
            TimePickerCustom(
              date: DateTime.now(),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Text("Sicuro di voler modificare la prenotazione?"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Annulla")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK")),
                        ],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
