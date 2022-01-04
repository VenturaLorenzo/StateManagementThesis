import 'dart:core';
import 'dart:math';
import 'package:redux_pattern/actions/app_state_actions.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux/redux.dart';
import '../models/todo.dart';

final todoReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, LoadTodoSucceededAction>(_setLoadedTodo),
  TypedReducer<List<Todo>, SetCompletedTodoAction>(_setCompletedTodo),
  TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
]);

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {
  Random rand = Random();
  List<int> ids = todos.map((todo) => todo.id).toList();
  int newId = rand.nextInt(1000) + 2;
  while (ids.contains(newId)) {
    newId = rand.nextInt(1000) + 2;
  }
  Todo newTodo = Todo(
      id: newId,
      name: action.name,
      description: action.desc + " " + newId.toString(),
      completed: false);

  return List.from(todos)..add(newTodo);
}

List<Todo> _setLoadedTodo(List<Todo> todos, LoadTodoSucceededAction action) {
  return action.todos;
}

List<Todo> _setCompletedTodo(List<Todo> todos, SetCompletedTodoAction action) {
  List<Todo> newList= todos.map((todo) => todo.id == action.id
      ? Todo(
          id: action.id,
          name: todo.name,
          description: todo.description,
          completed: action.completed)
      : todo).toList();

  return List.from(newList);
}

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action){

  List<Todo> newList= todos.map((todo) => todo.id == action.id
      ? Todo(
      id: action.id,
      name: action.name,
      description: action.desc,
      completed: todo.completed)
      : todo).toList();

  return List.from(newList);
}

