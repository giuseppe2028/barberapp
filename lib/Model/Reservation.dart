// To parse this JSON data, do
//
//     final allReservation = allReservationFromJson(jsonString);

import 'dart:convert';

AllReservation allReservationFromJson(String str) =>
    AllReservation.fromJson(json.decode(str));

String allReservationToJson(AllReservation data) => json.encode(data.toJson());

class AllReservation {
  Id id;
  int allReservationId;
  int phoneNumber;
  DateTime reservationDate;
  String reservationTime;
  AtedAt createdAt;
  AtedAt updatedAt;
  int v;

  AllReservation({
    required this.id,
    required this.allReservationId,
    required this.phoneNumber,
    required this.reservationDate,
    required this.reservationTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AllReservation.fromJson(Map<String, dynamic> json) => AllReservation(
        id: Id.fromJson(json["_id"]),
        allReservationId: json["id"],
        phoneNumber: json["phoneNumber"],
        reservationDate: DateTime.parse(json["reservationDate"]),
        reservationTime: json["reservationTime"],
        createdAt: AtedAt.fromJson(json["createdAt"]),
        updatedAt: AtedAt.fromJson(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "id": allReservationId,
        "phoneNumber": phoneNumber,
        "reservationDate":
            "${reservationDate.year.toString().padLeft(4, '0')}-${reservationDate.month.toString().padLeft(2, '0')}-${reservationDate.day.toString().padLeft(2, '0')}",
        "reservationTime": reservationTime,
        "createdAt": createdAt.toJson(),
        "updatedAt": updatedAt.toJson(),
        "__v": v,
      };
}

class AtedAt {
  DateTime date;

  AtedAt({
    required this.date,
  });

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
