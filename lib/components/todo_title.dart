import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function()? onPressed;

  ToDoTile({
    Key? key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              SizedBox(width: 150),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
