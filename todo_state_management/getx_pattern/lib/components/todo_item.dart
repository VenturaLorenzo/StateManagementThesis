import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: TodoItem");
final TodoController c= Get.find();
    return Row(
      children: [
        Text(todo.name.value + todo.description.value),
        Obx(
          () {
            return Checkbox(
                value: todo.completed.value,
                onChanged: (value) {
                  todo.completed.value = value!;
                });
          }
        ),
      ],
    );
  }
}
