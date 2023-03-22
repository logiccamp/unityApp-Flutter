import 'package:flutter/material.dart';

class ListTextFieldWidget extends StatelessWidget {
  ListTextFieldWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  bool isPassword;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: TextField(
        maxLines: hintText == "Address" ? 3 : 1,
        controller: controller,
        obscureText: isPassword,
        keyboardType: hintText == "Email Address"
            ? TextInputType.emailAddress
            : (hintText == "Telephone"
                ? TextInputType.phone
                : TextInputType.text),
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
