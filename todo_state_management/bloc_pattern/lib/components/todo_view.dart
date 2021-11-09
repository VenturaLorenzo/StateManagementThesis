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
    print("building: TodoView");

    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      return !((previous is FilteredTodoLoadedState) &&
          (next is FilteredTodoLoadedState) &&
          previous.todos.length == next.todos.length);
    }, builder: (context, filteredTodoState) {
      if (filteredTodoState is FilteredTodoLoadedState) {
        return ListView.builder(
            itemCount: filteredTodoState.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todoIndex: filteredTodoState.todos.elementAt(index).id,
                setCompleted: (completed) {
                  Todo todo = filteredTodoState.todos.elementAt(index);
                  BlocProvider.of<TodoBloc>(context).add(UpdateTodoEvent(Todo(
                      name: todo.name,
                      description: todo.description,
                      completed: completed ?? true, id: todo.id)));
                },
              );
            });
      } else if (filteredTodoState is FilteredTodoLoadingState) {
        return const CircularProgressIndicator();
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
