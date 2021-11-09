import 'package:redux/redux.dart';
import 'package:redux_pattern/actions/app_state_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/todo.dart';
import 'package:redux_pattern/repository/todo_repository.dart';

void loadTodosMiddleware(Store<AppState> store, action, NextDispatcher next) {

  if (action is LoadTodoAction) {
    TodoRepository.loadTodos().then((todos) {store.dispatch(LoadTodoSucceededAction(todos));} );
  }
  next(action);
}
