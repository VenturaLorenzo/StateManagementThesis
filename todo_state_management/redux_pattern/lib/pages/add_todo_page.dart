import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/todo.dart';
class AddTodoPage extends StatelessWidget {
  final String name;
  final String desc;

  const AddTodoPage({Key? key, required this.name, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Add Todo Page");

    return Scaffold(
      body: Column(
        children: [Text(name), Text(desc)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final AddTodoAction action=AddTodoAction(Todo(name: name, description: desc,completed: false));
          StoreProvider.of<AppState>(context).dispatch(action);
          Navigator.pop(context);
        },
      ),
    );
  }
}
