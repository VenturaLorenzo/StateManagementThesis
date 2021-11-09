import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/models/visibility_filter.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredTodoState extends Equatable {
  const FilteredTodoState();

  @override
  List<Object> get props => [];
}

class FilteredTodoLoadingState extends FilteredTodoState {

}

class FilteredTodoLoadedState extends FilteredTodoState {
  final List<Todo> todos;
  final VisibilityFilter filter;

  const FilteredTodoLoadedState(this.todos, this.filter);

  @override
  List<Object> get props => [todos, filter];
  @override
  String toString()=>'FilteredTodoLoadedState {todos: $todos, filter:$filter}';
}
