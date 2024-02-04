import 'package:http/http.dart' as https;
import 'package:riverpod/riverpod.dart';

import '../Model/Reservation.dart';

final lastReservationProvider =
    Provider<HomePageViewModel>((ref) => HomePageViewModel());

class HomePageViewModel {
  static var client = https.Client();
//TODO sistemare il lancio delle ecceccezioni
  Future<AllReservation> getNextReservation() async {
    String urlBase = "barberappserver-production.up.railway.app";
    String endPoint = "/api/reservation/11";
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.https(urlBase, endPoint);
    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      var lastReservation = allReservationFromJson(response.body);
      return lastReservation;
    } else {
      throw Exception('Errore durante la richiesta: ${response.statusCode}');
    }
  }
}
