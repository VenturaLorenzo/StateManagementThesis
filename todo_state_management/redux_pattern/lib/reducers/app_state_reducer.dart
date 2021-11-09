import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/reducers/tab_reducer.dart';
import 'package:redux_pattern/reducers/todo_reducer.dart';
import 'package:redux_pattern/reducers/visibility_filter_reducer.dart';

AppState appStateReducer(AppState appState, action) {
  return AppState(
      todos: todoReducer(appState.todos, action),
      tabState: tabReducer(appState.tabState, action),
      visibilityFilter: visibilityFilterReducer(appState.visibilityFilter,action));
}
