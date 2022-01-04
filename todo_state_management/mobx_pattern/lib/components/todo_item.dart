import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo_classic.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final todoList = Provider.of<TodoList>(context);
    //return Observer(builder: (_) {
      print("building TodoItem ${todo.id}");

      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/updateTodo", arguments: todo);
        },
        child: Row(
          children: [
            Column(
              children: [
                Text(todo.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
                Text(todo.description,
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  todoList.setCompleted(todo.id,value!);
                 // todo.completed = value!;
                }),
          ],
        ),
      );
   // });
  }
}
