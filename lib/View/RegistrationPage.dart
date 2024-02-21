import 'package:barberapp/Widget/TextFieldPersonal.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barber App"),
      ),
      body:
          LayoutBuilder(builder: (BuildContext context, BoxConstraints sizes) {
        return Center(
          child: SizedBox(
            width: sizes.maxWidth - 50,
            child: Column(
              children: [
                TextFieldPersonal(label: "Nome", controller: null),
                TextFieldPersonal(label: "Cognome", controller: null),
                TextFieldPersonal(label: "Email", controller: null),
                TextFieldPersonal(label: "Password", controller: null),
                ElevatedButton(onPressed: () {}, child: Text("Registrati"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
