
import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/components/todo_item.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
          previous.todos.length == next.todos.length &&
          listEquals(next.todos.map((e) => e.id).toList(),
              previous.todos.map((e) => e.id).toList()));
    }, builder: (context, filteredTodoState) {
      print("building: TodoView");

      if (filteredTodoState is FilteredTodoLoadedState) {
        return ListView.builder(
            itemCount: filteredTodoState.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                  key: UniqueKey(),
                  id: filteredTodoState.todos.elementAt(index).id);
            });
      } else if (filteredTodoState is FilteredTodoLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
