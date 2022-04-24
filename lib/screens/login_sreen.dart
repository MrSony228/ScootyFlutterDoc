import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scooty/screens/main_screen.dart';
import 'package:scooty/screens/registartion_screen.dart';
import 'package:scooty/screens/start_screen.dart';
import 'package:scooty/widgets/scooty_text_field.dart';

import '../internet_engine.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 146,
                height: 34,
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Добро пожаловать",
                  style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(
                height: 127,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "E-Mail",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ScootyTextField("scooty@gmail.com", emailController),
              const SizedBox(
                height: 20,
              ),
              ScootyTextField("Пароль", passwordController),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    onPressed: () async {
                      var result = await InternetEngine().login(emailController.text, passwordController.text);
                      if(result != true) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Ошибка"),
                                content: Text(
                                  "Код ошибки: " + result.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Закрыть"))
                                ],
                              );
                            });
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               MainScreen()),
                      );

                    },
                    child: const Text(
                      'Войти',
                    )),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "У вас нет аккаунта?   ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: const Text("Зарегистрируйтесь!",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
