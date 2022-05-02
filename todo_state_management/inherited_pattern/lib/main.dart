import 'package:flutter/material.dart';
import 'package:inherited_pattern/components/todo_item.dart';
import 'package:inherited_pattern/pages/add_todo_page.dart';
import 'package:inherited_pattern/pages/home_page.dart';
import 'package:inherited_pattern/pages/update_todo_page.dart';
import 'package:inherited_pattern/todo_provider.dart';
import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      child: MaterialApp(
        initialRoute: "/", //setting the HomePage as initial route
        routes: {
          //defining possible routes
          "/": (context) => const HomePage(),
          "/updateTodo": (context) => UpdateTodoPage(
                todo: (ModalRoute.of(context)!.settings.arguments
                        as UpdateTodoPageArguments)
                    .todo,
                callback: (ModalRoute.of(context)!.settings.arguments
                        as UpdateTodoPageArguments)
                    .updateState,
              ),
          "/addTodo": (context) => AddTodoPage(
              addTodoCallback: ModalRoute.of(context)!.settings.arguments
                  as Function(String, String)),
        },
      ),
    );
  }
}
