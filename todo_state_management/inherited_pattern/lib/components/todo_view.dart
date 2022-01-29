import 'package:flutter/cupertino.dart';
import 'package:inherited_pattern/components/todo_item.dart';
import 'package:inherited_pattern/models/todo.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';
import 'package:inherited_pattern/todo_provider.dart';

class TodoView extends StatelessWidget {

  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building TodoView");

    final List<Todo> filteredTodos = TodoInheritedData.of(context, aspect: 0).filteredTodos;

    return ListView.builder(
      itemCount: filteredTodos.length,
      itemBuilder: (context, index) {
        return TodoItem(
          key: UniqueKey(),
          id: filteredTodos.elementAt(index).id,
        );
      },
    );
  }
}
