import 'dart:core';

import 'package:redux_pattern/actions/app_state_actions.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux/redux.dart';

import '../models/todo.dart';

final todoReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, RemoveTodoAction>(_removeTodo),
  TypedReducer<List<Todo>, LoadTodoSucceededAction>(_setLoadedTodo),
  TypedReducer<List<Todo>, SetTodoAction>(_setTodo),

]);

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {

  return List.from(todos)..add(action.newTodo);
}

List<Todo> _removeTodo(List<Todo> todos, RemoveTodoAction action) {
  return List.from(todos)..remove(action.todo);
}

List<Todo> _setLoadedTodo(List<Todo> todos, LoadTodoSucceededAction action) {
    return action.todos;
}
List<Todo> _setTodo(List<Todo> todos, SetTodoAction action){
  return todos.map((todo)=>todo.name==action.todo.name? action.todo : todo).toList();
}
