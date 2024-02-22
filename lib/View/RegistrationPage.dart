import 'package:barberapp/Model/UserEntity.dart';
import 'package:barberapp/Navigation/Navigator.dart';
import 'package:barberapp/View/HomePage.dart';
import 'package:barberapp/ViewModel/RegistrationViewModel.dart';
import 'package:barberapp/Widget/DialogWindow.dart';
import 'package:barberapp/Widget/TextFieldPersonal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/UserModel.dart';
import '../Provider/data_provider.dart';

class RegistrationPage extends ConsumerWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  child: TextFieldPersonal(
                      label: "Nome", controller: nameController),
                ),
                TextFieldPersonal(
                    label: "Cognome", controller: surnameController),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFieldPersonal(
                      label: "Email", controller: mailController),
                ),
                TextFieldPersonal(
                    label: "Password", controller: passwordController),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  width: sizes.maxWidth - 150,
                  child: ElevatedButton(
                    onPressed: () {
                      var data = ref.watch(registrationProvider).insertUser(
                          UserModel(
                              name: nameController.text,
                              surname: surnameController.text,
                              password: passwordController.text,
                              mail: mailController.text));
                      data.then((value) => {
                            print("value è: $value"),
                            value != null
                                ? {
                                    NavigatorService.goTo(HomePage(), context),
                                    ref.read(userProvider.notifier).state =
                                        UserEntity(
                                            idUtente: value,
                                            name: nameController.text,
                                            surname: surnameController.text,
                                            password: passwordController.text,
                                            mail: mailController.text)
                                  }
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogWindow(
                                            text:
                                                "Registrazione non riuscita")),
                          });
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(100, 212, 144, 93))),
                    child: const Text(
                      "Registrati",
                      style: TextStyle(color: Colors.white),
                    ),
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
