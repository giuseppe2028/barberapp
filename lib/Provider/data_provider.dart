import 'package:barberapp/Model/Reservation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ViewModel/Home_Page_ViewModel.dart';

final nextReservationProvider = FutureProvider<Reservation?>((ref) async {
  return ref.watch(ReservationProvider).getNextReservation();
});
final deleteReservationProvider =
    ChangeNotifierProvider<HomePageViewModel>((ref) {
  return HomePageViewModel();
});
final pastReservationProvider = FutureProvider<List<Reservation>>((ref) async {
  return ref.watch(ReservationProvider).getPastReservation();
});
