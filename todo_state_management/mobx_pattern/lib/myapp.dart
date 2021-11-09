import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:mobx_pattern/pages/add_todo_page.dart';
import 'package:mobx_pattern/pages/home_page.dart';
import 'package:mobx_pattern/repository/todo_repository.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building MaterialApp");
    return Provider<TodoList>(create: (_)=>TodoList(repo: TodoRepository())..fetchTodos(),child: MaterialApp(
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
    ));
  }
}
