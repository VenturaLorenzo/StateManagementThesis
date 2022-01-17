  import 'package:flutter/material.dart';
import 'package:redux_pattern/middleware/todo_middleware.dart';
import 'package:redux_pattern/my_app.dart';
import 'package:redux_pattern/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';
import 'models/app_state.dart';

void main() {


  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
      store: Store<AppState>(appStateReducer,
          initialState: AppState(), middleware: [loadTodosMiddleware])));


}
