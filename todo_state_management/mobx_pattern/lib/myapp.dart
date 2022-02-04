import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:mobx_pattern/pages/add_todo_page.dart';
import 'package:mobx_pattern/pages/home_page.dart';
import 'package:mobx_pattern/pages/update_todo_page.dart';
import 'package:provider/provider.dart';

import 'models/todo.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building MaterialApp");
    return Provider<TodoStore>(
        create: (_) => TodoStore()..fetchTodos(),
        child: MaterialApp(initialRoute: "/", routes: {
          "/": (context) => HomePage(),
          "/addTodo": (context) => AddTodoPage(),
          "/updateTodo": (context) => UpdateTodoPage(
                todo: (ModalRoute.of(context)!.settings.arguments as Todo),
              ),
        }));
  }
}
