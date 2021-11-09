import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';
class AddTodoPage extends StatelessWidget {
  final String name;
  final String desc;

  const AddTodoPage({Key? key, required this.name, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building AddTodoPage");

    final todoList = Provider.of<TodoList>(context);
    return Scaffold(
      body: Column(
        children: [Text(name), Text(desc)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoList.addTodo(Todo(name:name,description:desc,completed: false));
            Navigator.pop(context);
        },
      ),
    );
  }
}
