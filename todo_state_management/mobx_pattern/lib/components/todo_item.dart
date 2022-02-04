import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final int id;

  const TodoItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context, listen: false);
    final todo = store.todos.where((element) => element.id == id).first;
    return Observer(builder: (_) {
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

                  store.setCompleted(todo.id, value!);

                }),
          ],
        ),
      );
    });
  }
}
