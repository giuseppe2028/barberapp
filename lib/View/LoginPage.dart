import 'package:barberapp/View/RegistrationPage.dart';
import 'package:barberapp/Widget/TextFieldPersonal.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barber App"),
      ),
      body: Column(
        children: [
          const Text("Benvenuto in Barber App"),
          const Text("Login"),
          TextFieldPersonal(label: "Email"),
          TextFieldPersonal(label: "Password"),
          Row(
            children: [
              Text("Non ancora registrato?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(),
                      ),
                    );
                  },
                  child: Text("SingUp")),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Login"))
        ],
      ),
    );
  }
}
