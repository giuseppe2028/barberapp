import 'dart:convert';

List<NumberReservationInDay> allReservationFromJson(String str) =>
    List<NumberReservationInDay>.from(
        json.decode(str).map((x) => NumberReservationInDay.fromJson(x)));

class NumberReservationInDay {
  int phoneNumber;
  DateTime reservationDate;
  DateTime createdAt;
  DateTime updatedAt;
  int idUtente;
  String reservationType;

  NumberReservationInDay(
      {required this.phoneNumber,
      required this.reservationDate,
      required this.createdAt,
      required this.updatedAt,
      required this.idUtente,
      required this.reservationType});

  factory NumberReservationInDay.fromJson(Map<String, dynamic> json) =>
      NumberReservationInDay(
          phoneNumber: json["phoneNumber"],
          reservationDate: DateTime.parse(json["reservationDate"]),
          createdAt: DateTime.parse(json["createdAt"]),
          updatedAt: DateTime.parse(json["updatedAt"]),
          idUtente: json["idUtente"],
          reservationType: json["reservationType"]);
}
