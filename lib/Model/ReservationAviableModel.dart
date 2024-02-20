import 'dart:convert';

List<ReservationAviable> allReservationAviableFromJson(String str) =>
    List<ReservationAviable>.from(
        json.decode(str).map((x) => ReservationAviable.fromJson(x)));

class Id {
  int? hour;
  int? minute;

  Id({this.hour, this.minute});

  Id.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
  }
}

class ReservationAviable {
  Id? id;
  int? count;

  ReservationAviable({this.id, this.count});

  factory ReservationAviable.fromJson(Map<String, dynamic> json) =>
      ReservationAviable(
          id: json['_id'] != null ? Id?.fromJson(json['_id']) : null,
          count: json['count']);
}
