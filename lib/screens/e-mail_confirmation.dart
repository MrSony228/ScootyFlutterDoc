import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scooty/model/user_to_register.dart';
import 'package:scooty/screens/registartion_screen.dart';
import 'package:scooty/screens/start_screen.dart';
import 'package:scooty/widgets/scooty_text_field.dart';

class EmailConfirmationScreen extends StatefulWidget {
  late UserToRegister user;

  EmailConfirmationScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmailConfirmationScreenState();
  }
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 146,
                height: 34,
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Подтверждение e-mail",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ]))));
  }
}
