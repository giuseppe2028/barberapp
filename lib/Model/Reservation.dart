// To parse this JSON data, do
//
//     final allReservation = allReservationFromJson(jsonString);

class Reservation {
  int phoneNumber;
  DateTime reservationDate;
  String reservationTime;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int idUtente;

  Reservation({
    required this.phoneNumber,
    required this.reservationDate,
    required this.reservationTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.idUtente,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        phoneNumber: json["phoneNumber"],
        reservationDate: DateTime.parse(json["reservationDate"]),
        reservationTime: json["reservationTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        idUtente: json["idUtente"],
      );
}
