import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/components/todo_item.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);
    return Observer(
      builder: (_) {
        print("building TodoView");

        return ListView.builder(
          itemCount: store.filteredTodos.length,
          itemBuilder: (context, index) {
            return TodoItem(
               id: store.filteredTodos.elementAt(index).id,
            );
          },
        );
      },
    );
  }
}
