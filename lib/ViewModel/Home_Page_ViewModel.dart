import 'dart:convert';

import 'package:barberapp/helpers/Confing.dart';
import 'package:http/http.dart' as https;
import 'package:riverpod/riverpod.dart';

import '../Model/Reservation.dart';

final lastReservationProvider =
    Provider<HomePageViewModel>((ref) => HomePageViewModel());
final deleteReservationProvider =
    Provider((ref) => HomePageViewModel().deleteReservation());

class HomePageViewModel {
  static var client = https.Client();
//TODO sistemare il lancio delle ecceccezioni
  Future<Reservation> getNextReservation() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    //var url = Uri.https(Config.baseURL, Config.pathWithID);
    var response =
        await client.get(Uri.parse(Config.complete), headers: requestHeader);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print("lista: ${result.elementAt(0)}");
      if (result.isNotEmpty) {
        // Restituisci il primo elemento della lista
        return Reservation.fromJson(result.first);
      } else {
        throw Exception('Nessuna prenotazione trovata');
      }
    } else {
      throw Exception('Errore durante la richiesta: ${response.statusCode}');
    }
  }

  Future<bool> deleteReservation() async {
    //var url = Uri.https(Config.baseURL, Config.pathWithID);
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var response =
        await client.delete(Uri.parse(Config.complete), headers: requestHeader);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Reservation>> getPastReservation() async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var response = await client.get(
        Uri.parse(Config.pathPastReservationComplete),
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
