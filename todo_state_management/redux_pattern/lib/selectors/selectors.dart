import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/todo.dart';
import 'package:redux_pattern/models/visibility_filter.dart';
import 'package:reselect/reselect.dart';

final todosSelector = (AppState state) => state.todos;

final filterSelector = (AppState state) => state.visibilityFilter;

final completedTodosSelector = createSelector1(
    todosSelector,
    (List<Todo> todos) =>
        todos.where((todo) => todo.completed == true).toList());
final pendingTodosSelector = createSelector1(
    todosSelector,
    (List<Todo> todos) =>
        todos.where((todo) => todo.completed == false).toList());

final filteredTodosSelector = createSelector4(
    todosSelector, filterSelector, completedTodosSelector, pendingTodosSelector,
    (List<Todo> todos, VisibilityFilter filter, List<Todo> completed,
        List<Todo> pending) {
  switch (filter) {
    case VisibilityFilter.completed:
      return completed;
    case VisibilityFilter.notCompleted:
      return pending;
    case VisibilityFilter.all:
      return todos;
  }
});
