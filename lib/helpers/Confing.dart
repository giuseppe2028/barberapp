import 'dart:core';

class Config {
  static String baseURL = 'http://192.168.1.116:5003';
  static String pathNextReservation = '$baseURL/api/reservation/';
  static String pathPastReservation = '$baseURL/api/reservation/past/11';
  static String pathUsers = '$baseURL/api/User/';
  static String pathReservationAviable =
      '$baseURL/api/reservation/ReservationAvaible/';
  static String pathNewUser = "$baseURL/api/user";
}
