import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/todo.dart';
import 'package:inherited_pattern/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final int id;

  const TodoItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Todo todo = TodoInheritedData.of(context, aspect: id)
        .todos
        .where((element) => element.id == id)
        .first;
    print("Building Todo Item $todo");

    return Row(
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
              TodoInheritedData.of(context, aspect: id)
                  .onSetCompleted(id, value!);
            }),
      ],
    );
  }
}
