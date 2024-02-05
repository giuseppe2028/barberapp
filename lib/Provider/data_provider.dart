import 'package:barberapp/Model/Reservation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ViewModel/Home_Page_ViewModel.dart';

final lastDataReservationProvider = FutureProvider<Reservation>((ref) async {
  return ref.watch(lastReservationProvider).getNextReservation();
});

final deleteDataReservationProvider = StateProvider<bool>((ref) => false);
final listDataReservationProvider =
    FutureProvider<List<Reservation>>((ref) async {
  return ref.watch(lastReservationProvider).getPastReservation();
});
