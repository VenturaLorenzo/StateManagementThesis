import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/todo.dart';

class UpdateTodoPage extends StatefulWidget {
  final Todo todo;
  final void Function(String,String) callback;

  const UpdateTodoPage({Key? key, required this.todo,required this.callback}) : super(key: key);

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
          title: const Text("Update Todo"),
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
                  border: OutlineInputBorder(), hintText: 'Enter a new description'),
            ),
            TextButton(onPressed: () {

              widget.callback(textControllerName.text,textControllerDesc.text);
              Navigator.pop(context);
            }, child: const Text("Confirm"))
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
