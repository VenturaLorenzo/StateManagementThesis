import 'package:bloc_pattern/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodosEvent {
  final String name;
  final String desc;

  const AddTodoEvent(this.name, this.desc);

  @override
  String toString() => 'TodosEvent - AddTodoEvent';
}

class DeleteTodoEvent extends TodosEvent {
  final int id;

  const DeleteTodoEvent(this.id);

  @override
  String toString() => 'TodosEvent - DeleteTodoEvent';
}
class SaveTodosEvent extends TodosEvent{
  final List<Todo> todos;
  const SaveTodosEvent(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosEvent - SaveTodoEvent  ';
}
class UpdateTodoEvent extends TodosEvent {
  final int id;
  final String newName;
  final String newDesc;

  const UpdateTodoEvent(this.id, this.newName, this.newDesc);

  @override
  List<Object> get props => [id, newName, newDesc];

  @override
  String toString() => 'TodosEvent - UpdateTodoEvent';
}

class LoadTodosEvent extends TodosEvent {
  @override
  String toString() => 'TodosEvent - LoadTodosEvent';
}

class RemoveTodoEvent extends TodosEvent {}

class SetCompletedTodoEvent extends TodosEvent {
  final int id;
  final bool completed;

  const SetCompletedTodoEvent(this.id, this.completed);

  @override
  String toString() => 'TodosEvent - SetCompletedTodoEvent';
}

class ToggleAllEvent extends TodosEvent {}

class ClearCompletedEvent extends TodosEvent {}
