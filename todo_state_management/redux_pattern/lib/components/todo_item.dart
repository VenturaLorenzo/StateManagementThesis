import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/todo.dart';

class TodoItem extends StatelessWidget {
  final int id;

  const TodoItem({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Todo>(
      distinct: true,
        converter: (store) =>
            store.state.todos.firstWhere((element) => element.id == id),
        builder: (context, todo) {
          print("building: Todo Item $id ");

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/updateTodo", arguments: todo);
            },
            child: Row(
              children: [
                Column(
                  children: [
                    Text(todo.name,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                    Text(todo.description,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Checkbox(
                    value: todo.completed,
                    onChanged: (completed) {
                      StoreProvider.of<AppState>(context).dispatch(
                          SetCompletedTodoAction(todo.id, completed!));
                    }),
              ],
            ),
          );
        });
  }
}
/*
class _ViewModel {
  String text;
  bool completed;

  _ViewModel({required this.completed, required this.text});

  @override
  bool operator ==(Object other) {
    return other is _ViewModel &&
        other.text == text &&
        other.completed == completed;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => text.hashCode;
}*/
