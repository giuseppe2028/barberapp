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
          const TextField(),
          const TextField(),
          Row(
            children: [
              Text("Non ancora registrato?"),
              TextButton(onPressed: () {}, child: Text("SingUp")),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Login"))
        ],
      ),
    );
  }
}
