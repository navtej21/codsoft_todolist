import 'package:codsoft_todolist/database/database.dart';
import 'package:flutter/material.dart';
import 'package:codsoft_todolist/Listtile/listtile.dart';
import 'package:codsoft_todolist/button_tile/buttontile.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoDatabase db = TodoDatabase();
  final box = Hive.box("todolist");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (box.get("todolist") == null) {
      db.createinitialdata();
    } else {
      db.loaddata();
    }
  }

  TextEditingController text = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blue.shade200,
        title: const Center(
          child: Text(
            'TO DO LISTS',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade100,
      body: ListView.builder(
        itemCount: db.lst.length,
        itemBuilder: (context, index) {
          return Listtile(
            task: db.lst[index][0],
            isChecked: db.lst[index][1],
            onChanged: (value) {
              setState(() {
                db.lst[index][1] = value;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Deleted Successfully"),
                  duration: Duration(seconds: 2),
                ));
                db.lst.removeAt(index);
                db.updatedata();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: TextField(
                    controller: text,
                    maxLines: 1,
                    maxLength: 20,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Enter Task"),
                  ),
                  content: Row(
                    children: [
                      ButtonTile(text: "add", function: addtask),
                      SizedBox(width: 60),
                      ButtonTile(text: "cancel", function: canceltask)
                    ],
                  ));
            },
          );
        },
        label: const Icon(Icons.add),
      ),
    );
  }

  void addtask() {
    setState(() {
      db.lst.add([text.text, false]);
      Navigator.of(context).pop();
    });
    db.updatedata();
  }

  void canceltask() {
    setState(() {
      Navigator.of(context).pop();
    });
  }
}
