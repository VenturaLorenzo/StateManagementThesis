import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building TodoItem");

    return Observer(builder:(_){
      return Row(
        children: [
          Text(todo.name + todo.description),
          Checkbox(value: todo.completed, onChanged: (value){ todo.completed= value!;}),
        ],
      );}
    );
  }
}
