import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/todo.dart';
class AddTodoPage extends StatelessWidget {
  final String name;
  final String desc;

  const AddTodoPage({Key? key, required this.name, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: AddTodoPage");

    final TodoController todoController= Get.find();
    return Scaffold(
      body: Column(
        children: [Text(name), Text(desc)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoController.todos.add(Todo(name:name,description:desc,completed: false));
            Navigator.pop(context);
        },
      ),
    );
  }
}
