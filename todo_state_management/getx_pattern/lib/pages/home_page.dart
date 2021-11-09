import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_pattern/components/stats.dart';
import 'package:getx_pattern/components/tab_selector.dart';
import 'package:getx_pattern/components/todo_view.dart';
import 'package:getx_pattern/components/visibility_filter_component.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/tab_state.dart';
import 'package:getx_pattern/models/todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final TodoController todoController = Get.find();


    print("building: HomePage");

    return Scaffold(
      appBar: AppBar(
        title: const Text("testo"),
        actions: const [VisibilityFilterComponent()],
      ),
      body: Obx(() {
        return todoController.tab.value == TabState.todos
            ? const TodoView()
            : const Stats();
      }),
      bottomNavigationBar: const TabSelector(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        todoController.todos
            .add(Todo(name: "io", description: "tu", completed: false));
        //Navigator.pushNamed(context, "/addTodo");
      }),
    );
  }
}
