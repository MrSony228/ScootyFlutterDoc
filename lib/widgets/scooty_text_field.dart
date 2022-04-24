import 'package:flutter/material.dart';

class ScootyTextField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;


  const ScootyTextField(this.hint, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black, fontSize: 17),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(7.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(7.0),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
        hintStyle: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }



}