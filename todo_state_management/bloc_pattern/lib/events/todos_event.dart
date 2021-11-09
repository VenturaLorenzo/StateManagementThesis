import 'package:bloc_pattern/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodosEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);

  @override
  String toString() => 'AddTodoEvent';
}

class UpdateTodoEvent extends TodosEvent {
  final Todo todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'UpdateTodoEvent {  }';
}

class LoadTodosEvent extends TodosEvent {}

class RemoveTodoEvent extends TodosEvent {}


class ToggleAllEvent extends TodosEvent {}

class ClearCompletedEvent extends TodosEvent {}
