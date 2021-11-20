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

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/updateTodo",
            arguments: UpdateTodoPageArguments(
                todo: todo,
                updateState: (String newName,String newDesc) {
                  TodoInheritedData.of(context, aspect: 0)
                      .onUpdateTodo(todo.id, newName,newDesc);
                }));
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
                TodoInheritedData.of(context, aspect: id)
                    .onSetCompleted(id, value!);
              }),
        ],
      ),
    );
  }
}

class UpdateTodoPageArguments {
  final Todo todo;
  final void Function(String ,String) updateState;

  UpdateTodoPageArguments({required this.todo, required this.updateState});
}
