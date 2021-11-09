import 'package:bloc_pattern/barrels/todo_state_management.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddTodoPage extends StatelessWidget {
  final String name;
  final String desc;

  const AddTodoPage({Key? key, required this.name, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: AddTodoPage");

    return Scaffold(
      body: Column(
        children: [Text(name), Text(desc)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
 final AddTodoEvent event=          AddTodoEvent(Todo(name: name, description: desc,completed: false, id: int.parse(name)));
          BlocProvider.of<TodoBloc>(context).add(event);
          Navigator.pop(context);
        },
      ),
    );
  }
}
