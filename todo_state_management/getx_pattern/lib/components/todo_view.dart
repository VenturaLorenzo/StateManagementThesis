import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_pattern/components/todo_item.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/todo.dart';
class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final TodoController todoController= Get.find();
print("building: TodoView");

return Obx(() {
  return ListView.builder(
    itemCount:
    todoController.filteredTodos.length,
    itemBuilder: (context, index) {
      return TodoItem(
        //todo:Todo(name:todoController.sum.toString(),description:"dfd",completed: false),
        todo:todoController.filteredTodos.elementAt(index),

      );
    },
  );
});

}}
