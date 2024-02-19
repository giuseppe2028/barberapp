import 'package:flutter/material.dart';

import 'CustomDatePicker.dart';

class DialogWidget extends StatelessWidget {
  late DateTime finalData;
  @override
  Widget build(BuildContext context) {
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
              onDateChanged: (DateTime value) {
                finalData = value;
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
