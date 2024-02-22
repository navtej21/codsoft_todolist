import 'package:flutter/material.dart';
import 'button_title.dart';

class NewTask extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  NewTask(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
          width: 300,
          height: 150,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter The New Task"),
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Button(text: "Submit", onpressed: save),
                SizedBox(width: 80),
                Button(text: "Cancel", onpressed: cancel)
              ])
            ],
          )),
    );
  }
}
