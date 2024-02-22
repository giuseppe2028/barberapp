import 'package:barberapp/Model/UserModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as https;

import '../helpers/Confing.dart';

final registrationProvider = Provider((ref) => RegistrationViewModel());

class RegistrationViewModel extends StateNotifier<bool> {
  Map<String, String> requestHeader = {'Content-Type': 'application/json'};
  static var client = https.Client();
  RegistrationViewModel() : super(false);
  Future<bool> insertUser(UserModel user) async {
    print("entro123");
    var response = await client.post(
        Uri.parse(
            "${Config.pathUsers}/${user.name}/${user.surname}/${user.mail}/${user.password}"),
        headers: requestHeader);
    if (response.statusCode == 200) {
      return true;
    } else
      return false;
  }
}
