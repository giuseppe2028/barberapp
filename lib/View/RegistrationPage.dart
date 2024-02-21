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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFieldPersonal(label: "Nome", controller: null),
                ),
                TextFieldPersonal(label: "Cognome", controller: null),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFieldPersonal(label: "Email", controller: null),
                ),
                TextFieldPersonal(label: "Password", controller: null),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  width: sizes.maxWidth - 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Registrati",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(100, 212, 144, 93))),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
