import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/events/filtered_todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/models/visibility_filter.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:bloc_pattern/barrels/todo_state_management.dart';
import 'package:flutter/cupertino.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final TodoBloc todoBloc;
  late StreamSubscription todoSubscription;


  FilteredTodoBloc({required this.todoBloc})
      : super(
    todoBloc.state is TodosLoadedState
        ? FilteredTodoLoadedState(
      (todoBloc.state as TodosLoadedState).todos,
      VisibilityFilter.all,
    )
        : FilteredTodoLoadingState(),
  ) {
    todoSubscription = todoBloc.stream.listen((state) {
      if (state is TodosLoadedState) {

        add(TodoUpdatedEvent((todoBloc.state as TodosLoadedState).todos));

      }
    });
  }

  @override
  Stream<FilteredTodoState> mapEventToState(FilteredTodoEvent event) async* {
    if (event is FilteredTodoChangeFilterEvent) {
     yield* _mapTodoChangeFilterEventToState(event);
    }
    else if (event is TodoUpdatedEvent) {

      yield* _mapTodoUpdatedEventToState(event);
    }
  }

  List<Todo> filterTodos(List<Todo> todos, VisibilityFilter filter) {
    return todos.where((todo) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.notCompleted) {
        return !todo.completed;
      } else {
        return todo.completed;
      }
    }).toList();
  }

  Stream<FilteredTodoState> _mapTodoChangeFilterEventToState(
      FilteredTodoChangeFilterEvent event) async* {
    if (todoBloc.state is TodosLoadedState) {
      yield FilteredTodoLoadedState(filterTodos(
          (todoBloc.state as TodosLoadedState).todos,
          event.filter), event.filter);
    }
  }

  Stream<FilteredTodoState> _mapTodoUpdatedEventToState(
      TodoUpdatedEvent event) async* {

    final filter = (state is FilteredTodoLoadedState)
        ? (state as FilteredTodoLoadedState).filter
        : VisibilityFilter.all;
    if (todoBloc.state is TodosLoadedState) {
      yield FilteredTodoLoadedState(filterTodos(
          (todoBloc.state as TodosLoadedState).todos,
          filter), filter);
    }
  }
  @override
  Future<void> close() {
    todoSubscription.cancel();
    return super.close();
  }
}