import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/events/todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/repository/todo_repository.dart';
import 'package:bloc_pattern/repository/utility.dart';
import 'package:bloc_pattern/states/todos_state.dart';

class TodoBloc extends Bloc<TodosEvent, TodosState> {
  TodoBloc() : super(TodosLoadingState());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is LoadTodosEvent) {
      yield* _mapLoadTodosToState(event);
    } else if (event is AddTodoEvent) {
      yield* _mapTodoAddedToState(event);
    } else if (event is UpdateTodoEvent) {
      yield* _mapTodoUpdatedToState(event);
    } else if (event is SetCompletedTodoEvent) {
      yield* _mapSetCompletedToState(event);
    } else if (event is ClearCompletedEvent) {
      yield* _mapClearCompletedToState();
    }
  }

  Stream<TodosState> _mapLoadTodosToState(LoadTodosEvent event) async* {
    try {
      final List<Todo> todos = await TodoRepository.loadTodos();
      yield TodosLoadedState(todos);
    } catch (e) {
      yield TodoErrorState();
    }
  }

  Stream<TodosState> _mapTodoAddedToState(AddTodoEvent event) async* {
    if (state is TodosLoadedState) {
      int newId = generateId((state as TodosLoadedState).todos);
      Todo newTodo = Todo(
          id: newId,
          name: event.name,
          description: event.desc + " " + newId.toString(),
          completed: false);
      final List<Todo> updatedTodos =
          List.from((state as TodosLoadedState).todos)..add(newTodo);
      yield TodosLoadedState(updatedTodos);
    }
  }

  Stream<TodosState> _mapTodoUpdatedToState(UpdateTodoEvent event) async* {
    if (state is TodosLoadedState) {
      List<Todo> newTodos = (state as TodosLoadedState)
          .todos
          .map((todo) => todo.id == event.id
              ? Todo(
                  id: event.id,
                  name: event.newName,
                  description: event.newDesc,
                  completed: false)
              : todo)
          .toList();
      yield TodosLoadedState(newTodos);
    }
  }


  Stream<TodosState> _mapClearCompletedToState() async* {
    if (state is TodosLoadedState) {
      List<Todo> notcleared = (state as TodosLoadedState)
          .todos
          .where((element) => !element.completed)
          .toList();
      yield TodosLoadedState(notcleared);
    }
  }

  Stream<TodosState> _mapSetCompletedToState(
      SetCompletedTodoEvent event) async* {
    if (state is TodosLoadedState) {
      List<Todo> newList = (state as TodosLoadedState)
          .todos
          .map((todo) => todo.id == event.id
              ? Todo(
                  name: todo.name,
                  description: todo.description,
                  id: todo.id,
                  completed: event.completed)
              : todo)
          .toList();
      yield TodosLoadedState(newList);
    }
  }
}
