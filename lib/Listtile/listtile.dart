import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  final String task;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const Listtile({
    Key? key,
    required this.task,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue.shade300,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Checkbox(
            value: isChecked,
            onChanged: onChanged,
          ),
          title: Text(
            task,
            style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              fontFamily: "hind",
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
