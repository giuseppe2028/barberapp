// To parse this JSON data, do
//
//     final allReservation = allReservationFromJson(jsonString);

import 'dart:convert';

List<Reservation> allReservationFromJson(String str) => List<Reservation>.from(
    json.decode(str).map((x) => Reservation.fromJson(x)));

class Reservation {
  int phoneNumber;
  DateTime reservationDate;
  DateTime createdAt;
  DateTime updatedAt;
  int idUtente;
  String reservationType;

  Reservation(
      {required this.phoneNumber,
      required this.reservationDate,
      required this.createdAt,
      required this.updatedAt,
      required this.idUtente,
      required this.reservationType});

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
      phoneNumber: json["phoneNumber"],
      reservationDate: DateTime.parse(json["reservationDate"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      idUtente: json["idUtente"],
      reservationType: json["reservationType"]);
}
