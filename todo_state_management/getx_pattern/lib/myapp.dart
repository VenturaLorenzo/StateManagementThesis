import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/pages/add_todo_page.dart';
import 'package:getx_pattern/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Get.put(TodoController());

    print("building: MaterialApp");
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) =>  HomePage(),
        "/addTodo": (context) {
          var rng = Random();

          return AddTodoPage(
              desc: rng.nextInt(10000).toString(),
              name: rng.nextInt(2345253).toString());
        },
      },
    );
  }
}
