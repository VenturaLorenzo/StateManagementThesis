import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/todo.dart';

class UpdateTodoPage extends StatefulWidget {
  final Todo todo;
  final void Function(String) callback;

  const UpdateTodoPage({Key? key, required this.todo,required this.callback}) : super(key: key);

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Todo"),
        ),
        body: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a new name'),
            ),
            TextButton(onPressed: () {

              widget.callback(textController.text);
              Navigator.pop(context);
            }, child: const Text("Confirm"))
          ],
        ));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
