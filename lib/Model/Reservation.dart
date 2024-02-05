// To parse this JSON data, do
//
//     final allReservation = allReservationFromJson(jsonString);

import 'dart:convert';

List<Reservation> allReservationFromJson(String str) => List<Reservation>.from(
    json.decode(str).map((x) => Reservation.fromJson(x)));

class Reservation {
  int phoneNumber;
  DateTime reservationDate;
  String reservationTime;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int idUtente;
  String reservationType;

  Reservation(
      {required this.phoneNumber,
      required this.reservationDate,
      required this.reservationTime,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      required this.idUtente,
      required this.reservationType});

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
      phoneNumber: json["phoneNumber"],
      reservationDate: DateTime.parse(json["reservationDate"]),
      reservationTime: json["reservationTime"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
      idUtente: json["idUtente"],
      reservationType: json["reservationType"]);
}
