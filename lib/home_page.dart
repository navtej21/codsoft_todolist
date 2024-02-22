import 'package:codsoft_todolist/components/new_task.dart';
import 'package:flutter/material.dart';
import 'package:codsoft_todolist/components/todo_title.dart';
import 'package:flutter/material.dart'; // Make sure to import your ToDoTile widget here

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<List<dynamic>> lst = [
    ["Make Tutorial", false],
    ["Exercise", true],
    ["Mathematics", true],
    ['John', true]
  ];

  void checkboxMethod(bool? value, int index) {
    setState(() {
      lst[index][1] = !lst[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      lst.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTask(
          controller: _controller,
          save: saveNewTask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      lst.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('TO DO LISTS')),
        elevation: 5,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: lst[index][0],
            taskcompleted: lst[index][1],
            onChanged: (value) => checkboxMethod(value, index),
            onPressed: () => deleteTask(index),
          );
        },
        itemCount: lst.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
