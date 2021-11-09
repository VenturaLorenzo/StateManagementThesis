import 'package:redux_pattern/models/tab_state.dart';
import 'package:redux_pattern/models/todo.dart';
import 'package:redux_pattern/models/visibility_filter.dart';

class AppState {

  VisibilityFilter visibilityFilter;
  List<Todo> todos;
  TabState tabState;

  AppState({this.todos=const [],this.tabState= TabState.todos,this.visibilityFilter= VisibilityFilter.all});
}