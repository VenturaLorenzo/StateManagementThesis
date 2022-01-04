import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';

class AddTodoPage extends StatefulWidget {


  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final textControllerName = TextEditingController();
  final textControllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: Column(
          children: [
            TextField(
              controller: textControllerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a name'),
            ),
            TextField(
              controller: textControllerDesc,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a description'),
            ),
            TextButton(onPressed: () {
              final todoList = Provider.of<TodoList>(context,listen: false);
              todoList.addTodo(textControllerName.text, textControllerDesc.text);
              Navigator.pop(context);
            }, child: const Text("Create"))
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
