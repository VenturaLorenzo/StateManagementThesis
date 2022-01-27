import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/events/todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItemSelector extends StatelessWidget {
  final int id;
  const TodoItemSelector({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      return previous.runtimeType != next.runtimeType;
    }, builder: (context, state) {
      print("building: TodoITem builder");

      if (state is FilteredTodoLoadedState) {
        Todo newTodo = state.todos.where((element) => element.id == id).first;
        return BlocSelector<FilteredTodoBloc, FilteredTodoState, Todo>(
            selector: (state) {
          if ((state as FilteredTodoLoadedState)
              .todos
              .map((e) => e.id)
              .contains(id)) {
            newTodo = state.todos.where((element) => element.id == id).first;
          }
          return newTodo;
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
