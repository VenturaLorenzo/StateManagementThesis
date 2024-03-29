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
    } else if (event is DeleteTodoEvent) {
      yield* _mapTodoDeletedToState(event);
    }
  }

  Stream<TodosState> _mapLoadTodosToState(LoadTodosEvent event) async* {
    try {
      final List<Todo> todos = await TodoRepository.loadTodos();
      yield TodosLoadedState(todos);
    } catch (e) {
      yield TodosLoadingState();
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
      yield TodosMutatedState( false,updatedTodos);
      await TodoRepository.saveTodos(updatedTodos);
      yield TodosMutatedState( true,updatedTodos);
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
      yield TodosMutatedState( false,newTodos);
      await TodoRepository.saveTodos(newTodos);
      yield TodosMutatedState( true,newTodos);
    }
  }

  Stream<TodosState> _mapTodoDeletedToState(DeleteTodoEvent event) async* {
    if (state is TodosLoadedState) {
      List<Todo> newTodos = List.from((state as TodosLoadedState).todos)
        ..removeWhere((element) => element.id == event.id);
      yield TodosLoadedState(newTodos);
      await TodoRepository.saveTodos(newTodos);
      yield TodosMutatedState( true,newTodos);
    }
  }

  Stream<TodosState> _mapSetCompletedToState(
      SetCompletedTodoEvent event) async* {
    if (state is TodosLoadedState) {// create a new updated list
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
