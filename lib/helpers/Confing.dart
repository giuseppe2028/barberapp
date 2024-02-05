import 'dart:core';

class Config {
  static String baseURL = 'http://192.168.1.116:5003';
  static String pathWithID = '/api/reservation/11';
  static String pathPastReservation = '/api/reservation/past/11';
  static String complete = baseURL + pathWithID;
  static String pathPastReservationComplete = baseURL + pathPastReservation;
}
