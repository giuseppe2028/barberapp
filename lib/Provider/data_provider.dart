import 'package:barberapp/Model/Reservation.dart';
import 'package:barberapp/Model/UserEntity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/ReservationAviableModel.dart';
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
final dateTimeProvider = StateProvider<DateTime>((ref) => DateTime.now());
final reservationAviableProvider =
    FutureProvider<List<ReservationAviable>?>((ref) async {
  return ref
      .watch(ReservationProvider)
      .verifyAvailability(ref.watch(dateTimeProvider));
});

final userProvider = StateProvider<UserEntity?>((ref) => null);
