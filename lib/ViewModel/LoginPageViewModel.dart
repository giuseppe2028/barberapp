import 'package:riverpod/riverpod.dart';

final landingViewProvider = StateNotifierProvider<LoginPageViewModel, bool>(
    (ref) => LoginPageViewModel());

class LoginPageViewModel extends StateNotifier<bool> {
  LoginPageViewModel() : super(false);
  Future<bool> _getUser(String mail, String password) {}
  Future<bool> verifyUser(String mail, String password) {
    //controllo username e password, se non vi è ritorno false, altrimenti ritorno true
  }
}
