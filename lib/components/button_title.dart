import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onpressed; // Using VoidCallback for the onPressed callback

  Button({Key? key, required this.text, required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Text(text),
      color: Colors.yellow.shade100,
    );
  }
}
