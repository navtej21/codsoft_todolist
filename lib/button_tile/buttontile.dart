import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  final String text;
  void Function() function;
  ButtonTile({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: function, color: Colors.blue.shade400, child: Text(text));
  }
}
