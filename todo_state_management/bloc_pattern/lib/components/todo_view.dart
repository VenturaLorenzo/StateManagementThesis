import 'package:bloc_pattern/barrels/todo_filtered_state_management.dart';
import 'package:bloc_pattern/barrels/todo_state_management.dart';
import 'package:bloc_pattern/components/todo_item.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      return !((previous is FilteredTodoLoadedState) &&
          (next is FilteredTodoLoadedState) &&
          previous.todos.length == next.todos.length);
    }, builder: (context, filteredTodoState) {
      print("building: TodoView");

      if (filteredTodoState is FilteredTodoLoadedState) {
        return Column(children:filteredTodoState.todos.map((e) => TodoItem(
          id: e.id
        )).toList());
      } else if (filteredTodoState is FilteredTodoLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
