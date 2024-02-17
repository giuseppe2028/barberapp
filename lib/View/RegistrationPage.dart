import 'package:barberapp/Widget/TextFieldPersonal.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barber App"),
      ),
      body: Column(
        children: [
          TextFieldPersonal(
            label: "Nome",
          ),
          TextFieldPersonal(label: "Cognome"),
          TextFieldPersonal(label: "Email"),
          TextFieldPersonal(label: "Password"),
          ElevatedButton(onPressed: () {}, child: Text("Registrati"))
        ],
      ),
    );
  }
}
