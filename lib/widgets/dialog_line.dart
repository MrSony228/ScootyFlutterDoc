

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogLine extends StatelessWidget{

  final String text;
  final IconData icon;
  final GestureTapCallback action;

  const DialogLine( this.text, this.icon, this.action);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Cera-Pro',
        ),
      ),
      onTap: action,
    );
  }
}