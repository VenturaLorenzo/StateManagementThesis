import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building Stats");

    final todoList = Provider.of<TodoList>(context);
    return Observer(
      builder: (context) {
        print("building TabSelector");

        return Center(child: Text(todoList.stats));
      },
    );
  }
}
