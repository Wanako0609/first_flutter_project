import 'package:flutter/material.dart';

class MyCustomeTextField extends StatefulWidget {
  MyCustomeTextField(
      {this.hintText = "",
      this.obscureText = false,
      this.padding = EdgeInsets.zero,
      this.controller});

  String hintText;
  bool obscureText;
  EdgeInsets padding;

  void Function(String controlleur)? controller;

  @override
  _MyCustomeTextFieldState createState() => _MyCustomeTextFieldState();
}

class _MyCustomeTextFieldState extends State<MyCustomeTextField> {
  TextEditingController strcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: widget.hintText),
            obscureText: widget.obscureText,
            controller: strcontroller,
          ),
        ],
      ),
    );
  }
}
