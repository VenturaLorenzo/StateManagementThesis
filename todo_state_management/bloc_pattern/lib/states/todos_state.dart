import 'package:bloc_pattern/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoadingState extends TodosState {
  @override
  String toString() => 'TodosState - TodosLoadingState';
}

class TodosLoadedState extends TodosState {
  final List<Todo> todos;

  const TodosLoadedState(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosState - TodosLoadedState';
}

class TodosMutatedState extends TodosLoadedState {
  final bool saved;

  const TodosMutatedState(this.saved,todos) : super(todos);

  @override
  List<Object> get props => [todos,saved];

  @override
  String toString() => 'TodosState - TodosMutatedState';
}
class TodosInitialState extends TodosLoadedState {

  const TodosInitialState(todos) : super(todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosState - TodosInitialState';
}
