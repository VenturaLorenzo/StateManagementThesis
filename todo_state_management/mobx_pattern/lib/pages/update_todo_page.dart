import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:provider/provider.dart';

class UpdateTodoPage extends StatefulWidget {
  final Todo todo;

  const UpdateTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final textControllerName = TextEditingController();
  final textControllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update " + widget.todo.name),
        ),
        body: Column(
          children: [
            TextField(
              controller: textControllerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a new name'),
            ),
            TextField(
              controller: textControllerDesc,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a new description'),
            ),
            TextButton(
                onPressed: () {
                  final store =
                      Provider.of<TodoStore>(context, listen: false);
                  store.updateTodo(widget.todo.id, textControllerName.text,
                      textControllerDesc.text);
                  Navigator.pop(context);
                },
                child: const Text("Confirm"))
          ],
        ));
  }

  @override
  void dispose() {
    textControllerName.dispose();
    textControllerDesc.dispose();
    super.dispose();
  }
}
