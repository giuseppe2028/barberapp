import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:riverpod/riverpod.dart';

import '../Model/Reservation.dart';

final lastReservationProvider =
    Provider<HomePageViewModel>((ref) => HomePageViewModel());

class HomePageViewModel {
  static var client = https.Client();
//TODO sistemare il lancio delle ecceccezioni
  Future<Reservation> getNextReservation() async {
    String urlBase = "barberappserver-production.up.railway.app";
    String endPoint = "/api/reservation/11";
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.https(urlBase, endPoint);
    var response = await client.get(url, headers: requestHeader);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

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
}
