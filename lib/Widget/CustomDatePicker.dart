import 'package:barberapp/Model/ReservationAviableModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/data_provider.dart';

class TimePickerCustom extends ConsumerWidget {
  DateTime? dataToReturn;
  DateTime? date;
  VoidCallback? onPressed;
  final officeHours = {
    'Mattina': [
      '09:00',
      '09:30',
      '10:00',
      '10:30',
      '11:00',
      '11:30',
    ],
    'Pomeriggio': [
      '12:00',
      '12:30',
      '16:00',
      '16:30',
    ],
    'Sera': [
      '17:00',
      '17:30',
      '18:00',
      '18:30',
      '19:00',
    ]
  };
  TimePickerCustom({required this.date, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(reservationAviableProvider);
    return data.when(
        data: (data) {
          return DataTable(
              dividerThickness: 0,
              horizontalMargin: 5,
              columnSpacing: 20,
              columns: const [
                DataColumn(
                  label: Text('Mattina'),
                ),
                DataColumn(
                  label: Text('Pomeriggio'),
                ),
                DataColumn(
                  label: Text('Sera'),
                ),
              ],
              rows: _buildRows(data));
        },
        error: (err, s) => Text(err.toString()),
        loading: () => CircularProgressIndicator());
  }

  List<DataRow> _buildRows(List<ReservationAviable>? data) {
    List<DataRow> rows = [];
    int maxLength = _calculateMaxLength();

    for (int i = 0; i < maxLength; i++) {
      String morningTime =
          i < officeHours['Mattina']!.length ? officeHours['Mattina']![i] : '';
      String afternoonTime = i < officeHours['Pomeriggio']!.length
          ? officeHours['Pomeriggio']![i]
          : '';
      String eveningTime =
          i < officeHours['Sera']!.length ? officeHours['Sera']![i] : '';
      buildRowSpecific(
          Colors.black, morningTime, afternoonTime, eveningTime, rows, data);
    }

    return rows;
  }

  int _calculateMaxLength() {
    int maxLength = 0;

    officeHours.values.forEach((element) {
      if (element.length > maxLength) {
        maxLength = element.length;
      }
    });

    return maxLength;
  }

  void buildRowSpecific(Color color, String morningTime, String afternoonTime,
      String eveningTime, List<DataRow> rows, List<ReservationAviable>? data) {
    final filteredData = data
        ?.where((element) => element.count != null && element.count! > 3)
        .toList();
    if (filteredData != null) {
      for (int i = 0; i < filteredData.length; i++) {
        if (filteredData[i].count != null && filteredData[i].count! > 3) {
          color = Colors.red;
        } else {
          color = Colors.black;
        }
      }
    } else {
      color = Colors.black;
    }

    rows.add(
      DataRow(cells: [
        DataCell(InkWell(
            child: Text(
              morningTime,
              style: TextStyle(color: color),
            ),
            onTap: () {
              int hour = int.parse(morningTime.substring(0, 2));
              int minute = int.parse(morningTime.substring(3, 5));
              DateTime data =
                  DateTime(date!.year, date!.month, date!.day, hour, minute);
              dataToReturn = data;
              onPressed!();
            })),
        DataCell(InkWell(
            child: Text(afternoonTime),
            onTap: () {
              int hour = int.parse(afternoonTime.substring(0, 2));
              int minute = int.parse(afternoonTime.substring(3, 5));
              DateTime data =
                  DateTime(date!.year, date!.month, date!.day, hour, minute);
              dataToReturn = data;
              onPressed!();
            })),
        DataCell(InkWell(
            child: Text(eveningTime),
            onTap: () {
              int hour = int.parse(eveningTime.substring(0, 2));
              int minute = int.parse(eveningTime.substring(3, 5));
              DateTime data =
                  DateTime(date!.year, date!.month, date!.day, hour, minute);
              dataToReturn = data;
              onPressed!();
            }))
      ]),
    );
  }
}
