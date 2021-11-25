import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/events/todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/repository/todo_repository.dart';
import 'package:bloc_pattern/states/todos_state.dart';

class TodoBloc extends Bloc<TodosEvent, TodosState> {
  TodoBloc() : super(TodosLoadingState());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is LoadTodosEvent) {
      yield* _mapTodosLoadedToState();
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

  Stream<TodosState> _mapTodosLoadedToState() async* {
    try {
      final List<Todo> todos = await TodoRepository.loadTodos();
      yield TodosLoadedState(todos);
    } catch (e) {
      yield TodoFailedState();
    }
  }

  Stream<TodosState> _mapTodoAddedToState(AddTodoEvent event) async* {
    if (state is TodosLoadedState) {
      Random rand = Random();
      List<int> ids =
      (state as TodosLoadedState).todos.map((todo) => todo.id).toList();
      int newId = rand.nextInt(1000) + 2;
      while (ids.contains(newId)) {
        newId = rand.nextInt(1000) + 2;
      }
      Todo newTodo = Todo(
          id: newId,
          name: event.name,
          description: event.desc + " " + newId.toString(),
          completed: false);
      final List<Todo> updatedTodos =
      List.from((state as TodosLoadedState).todos)
        ..add(newTodo);
      yield TodosLoadedState(updatedTodos);
    }
  }

  Stream<TodosState> _mapTodoUpdatedToState(UpdateTodoEvent event) async* {
    if (state is TodosLoadedState) {
      List<Todo> newTodos = (state as TodosLoadedState)
          .todos
          .map((todo) =>
      todo.id == event.id
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

  Stream<TodosState> _mapToggleAllToState() async* {
    if (state is TodosLoadedState) {
      List<Todo> toggled = (state as TodosLoadedState)
          .todos
          .map((todo) =>
          Todo(
              completed: true,
              description: todo.description,
              name: todo.name,
              id: todo.id))
          .toList();
      yield TodosLoadedState(toggled);
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
      List<Todo> newList = (state as TodosLoadedState).todos.map((todo) =>
      todo.id == event.id ? Todo(name: todo.name,
          description: todo.description,
          id: todo.id,
          completed: event.completed):todo).toList();
      yield
      TodosLoadedState(newList);
    }
  }
}
