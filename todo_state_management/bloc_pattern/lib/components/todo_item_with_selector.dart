import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/events/todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:bloc_pattern/states/todos_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItemSelector extends StatelessWidget {
  final int id;
  const TodoItemSelector({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodosState>(
        buildWhen: (previous, next) {
      return previous.runtimeType != next.runtimeType;
    }, builder: (context, state) {
      if (state is TodosLoadedState) {

        return BlocSelector<TodoBloc, TodosState, Todo>(
            selector: (state) {
          return (state as TodosLoadedState).todos.firstWhere((element) => element.id==id);
        }, builder: (context, todo) {
          print("building: Todo Item $id " + key.toString());

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
                      BlocProvider.of<TodoBloc>(context)
                          .add(SetCompletedTodoEvent(id, completed!));
                    }),
              ],
            ),
          );
        });
      } else {
        return Row(
          children: const [
            Text("ERROR"),
          ],
        );
      }
    });
  }
}
