import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/components/todo_item.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';
class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building TodoView");

    final todoList = Provider.of<TodoList>(context);
    return Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: todoList.filteredTodos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: todoList.filteredTodos.elementAt(index),

              );
            },
          );
        },


        );
  }
}
