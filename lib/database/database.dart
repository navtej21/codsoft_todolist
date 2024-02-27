import 'package:hive/hive.dart';
import 'package:codsoft_todolist/main.dart';

class TodoDatabase {
  List lst = [];

  final _mybox = Hive.box("todolist");

  void createinitialdata() {
    lst = [
      ["jogging", true],
      ["gym", false]
    ];
  }

  void loaddata() {
    lst = _mybox.get("todolist");
  }

  void updatedata() {
    _mybox.put("todolist", lst);
  }
}
