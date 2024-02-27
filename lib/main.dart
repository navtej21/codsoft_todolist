import 'package:codsoft_todolist/Listtile/listtile.dart';
import 'package:codsoft_todolist/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("todolist");
  runApp(
      const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}
