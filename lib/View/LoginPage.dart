import 'package:barberapp/Navigation/Navigator.dart';
import 'package:barberapp/View/HomePage.dart';
import 'package:barberapp/View/RegistrationPage.dart';
import 'package:barberapp/Widget/TextFieldPersonal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ViewModel/LoginPageViewModel.dart';

class LoginPage extends ConsumerWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barber App"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints sizes) {
          return Center(
            child: SizedBox(
              width: sizes.maxWidth - 50,
              child: Column(
                children: [
                  const Text("Benvenuto in Barber App"),
                  const Text("Login"),
                  TextFieldPersonal(
                    label: "Email",
                    controller: mailController,
                  ),
                  TextFieldPersonal(
                    label: "Password",
                    controller: passwordController,
                  ),
                  Row(
                    children: [
                      Text("Non ancora registrato?"),
                      TextButton(
                          onPressed: () {
                            NavigatorService.goTo(RegistrationPage(), context);
                          },
                          child: Text("SingUp")),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final data = ref.watch(loadingViewProvider).getUser(
                            mailController.text, passwordController.text);
                        data.then((value) => {
                              value == null
                                  ? showDialogWindow(context)
                                  : NavigatorService.goTo(HomePage(), context)
                            });
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future showDialogWindow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Mail or password incorrect. Please try again'),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
