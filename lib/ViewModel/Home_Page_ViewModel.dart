import 'dart:convert';

import 'package:barberapp/helpers/Confing.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:riverpod/riverpod.dart';

import '../Model/Reservation.dart';

final ReservationProvider =
    Provider<HomePageViewModel>((ref) => HomePageViewModel());

class HomePageViewModel extends ChangeNotifier {
  bool deleteNextReservation = false;
  static var client = https.Client();
//TODO sistemare il lancio delle ecceccezioni
  Future<Reservation?> getNextReservation() async {
    print("test1");
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    //var url = Uri.https(Config.baseURL, Config.pathWithID);
    var response = await client.get(
        Uri.parse("${Config.pathNextReservation}11"),
        headers: requestHeader);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      if (result.isNotEmpty) {
        // Restituisci il primo elemento della lista
        return Reservation.fromJson(result.first);
      } else {
        return null;
      }
    }
  }

  Future<bool> deleteReservation(int idUtente, DateTime data) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var response = await client.delete(
        Uri.parse(
            '${Config.pathNextReservation}$idUtente/${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}'),
        headers: requestHeader);
    print(
        "${Config.pathNextReservation}$idUtente/${data.year}-${data.month}-${data.day}");
    if (response.statusCode == 200) {
      deleteNextReservation = true;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<List<Reservation>> getPastReservation() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var response = await client.get(Uri.parse(Config.pathPastReservation),
        headers: requestHeader);

    if (response.statusCode == 200) {
      print(response.body);
      List<Reservation> result = allReservationFromJson(response.body);
      print("la dimensione è: ${result.length}");
      if (result.isNotEmpty) {
        return result;
      } else {
        throw Exception('Nessuna prenotazione trovata');
      }
    } else {
      //TODO modifica questo obbrobrio
      throw ("Errore");
    }
  }
}
