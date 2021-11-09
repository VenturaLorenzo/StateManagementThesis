import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/todo.dart';
import 'package:inherited_pattern/todo_provider.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    print("Building Todo Item ${widget.todo}");


      return Row(
        children: [
          Column(
            children: [
              Text(widget.todo.name,style: const TextStyle(fontSize: 14,color: Colors.black)),
              Text(widget.todo.description ,style: const TextStyle(fontSize: 10,color: Colors.grey)),

            ],
          ),
          Checkbox(value: widget.todo.completed, onChanged:(value){ TodoInheritedData.of(context,aspect: widget.todo.id)!.onSetCompleted(widget.todo.id,value!);}),
        ],
      );

  }
}
