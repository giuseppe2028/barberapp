import 'dart:convert';

import 'package:barberapp/Model/UserEntity.dart';
import 'package:barberapp/Model/UserModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as https;

import '../helpers/Confing.dart';

final registrationProvider = Provider((ref) => RegistrationViewModel());

class RegistrationViewModel extends StateNotifier<bool> {
  Map<String, String> requestHeader = {'Content-Type': 'application/json'};
  static var client = https.Client();
  RegistrationViewModel() : super(false);
  Future<String?> insertUser(UserModel user) async {
    var response = await client.post(
        Uri.parse(
            "${Config.pathUsers}/${user.name}/${user.surname}/${user.mail}/${user.password}"),
        headers: requestHeader);
    print("response: ${response.statusCode}");
    if (response.statusCode != 500) {
      //request the id:
      var response = await client.get(
          Uri.parse("${Config.pathUsers}${user.mail}/${user.password}"),
          headers: requestHeader);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (result.isNotEmpty)
          return UserEntity.fromJson(result.first).idUtente;
      } else
        return null;
    } else
      return null;
  }
}
