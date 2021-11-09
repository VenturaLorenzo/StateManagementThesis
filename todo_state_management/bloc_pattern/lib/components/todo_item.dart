import 'package:bloc_pattern/barrels/todo_filtered_state_management.dart';
import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItem extends StatelessWidget {
  final ValueChanged<bool?> setCompleted;
  final int todoIndex;

  const TodoItem(
      {Key? key, required this.todoIndex, required this.setCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: TodoIdem ${todoIndex}");

    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      return !((previous is FilteredTodoLoadedState) &&
          (next is FilteredTodoLoadedState) &&
          previous.todos.firstWhere((element) => element.id == todoIndex) ==
              next.todos.firstWhere((element) => element.id == todoIndex));
    }, builder: (context, state) {
      print("building: Checkbox ${todoIndex.toString()}");

      if (state is FilteredTodoLoadedState) {
        Todo t =
            (state).todos.firstWhere((element) => element.id == todoIndex);
        return Row(
          children: [
            Text(t.name + t.description),
            Checkbox(value: t.completed, onChanged: setCompleted),
          ],
        );
      }
      return Row(
        children: [
          const Text("ERROR"),
          Checkbox(value: false, onChanged: setCompleted),
        ],
      );
    });
  }
}
