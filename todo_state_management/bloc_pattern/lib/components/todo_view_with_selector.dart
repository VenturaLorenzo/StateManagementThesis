import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/components/todo_item.dart';
import 'package:bloc_pattern/components/todo_item_with_selector.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:bloc_pattern/states/todos_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoViewSelector extends StatelessWidget {
  const TodoViewSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      return previous.runtimeType != next.runtimeType;
    }, builder: (context, filteredTodoState) {
      print("building: TodoView builder");

      if (filteredTodoState is FilteredTodoLoadedState) {
        return BlocSelector<FilteredTodoBloc, FilteredTodoState, _ViewModel>(
            selector: (state) =>
                _ViewModel(todos: (state as FilteredTodoLoadedState).todos),
            builder: (context, filteredList) {
              print("building: TodoView");
              return ListView.builder(
                  itemCount: filteredList.todos.length,
                  itemBuilder: (context, index) {
                    return BlocSelector<TodoBloc, TodosState, Todo>(
                      selector: (state) {
                        List<Todo> todos = (state as TodosLoadedState)
                            .todos
                            .where((element) =>
                                element.id ==
                                filteredList.todos.elementAt(index).id)
                            .toList();
                        return todos.first;
                      },
                      builder: (context, todo) {
                        return TodoItemSelector(key: UniqueKey(), todo: todo);
                      },
                    );
                  });
            });
      } else if (filteredTodoState is FilteredTodoLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

class _ViewModel {
  final List<Todo> todos;

  _ViewModel({required this.todos});

  @override
  bool operator ==(Object other) {
    return ((other is _ViewModel) &&
        todos.length == other.todos.length &&
        todos.every(
            (todo) => other.todos.any((element) => todo.id == element.id)));
  }

  @override
  // TODO: implement hashCode
  int get hashCode => todos.hashCode;
}
