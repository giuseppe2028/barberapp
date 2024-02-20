import 'dart:convert';

import 'package:barberapp/Model/UserModel.dart';
import 'package:http/http.dart' as https;
import 'package:riverpod/riverpod.dart';

import '../helpers/Confing.dart';

final loadingViewProvider = Provider((ref) => LoginPageViewModel());

class LoginPageViewModel extends StateNotifier<bool> {
  Map<String, String> requestHeader = {'Content-Type': 'application/json'};
  static var client = https.Client();
  LoginPageViewModel() : super(false);
  Future<UserModel?> getUser(String mail, String password) async {
    var response = await client.get(
        Uri.parse("${Config.pathUsers}" + "$mail/" + "$password"),
        headers: requestHeader);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      if (result.isNotEmpty) return UserModel.fromJson(result.first);
    } else
      return null;
  }

  Future<bool> verifyUser(String mail, String password) async {
    UserModel? user = await getUser(mail, password);
    if (user == null)
      return false;
    else
      return true;
  }
}
