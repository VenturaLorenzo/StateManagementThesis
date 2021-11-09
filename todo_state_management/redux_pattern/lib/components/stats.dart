import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/models/app_state.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Stats");

    return StoreConnector<AppState, int>(
        builder: (context , completed){return Text(completed.toString());},
        converter: (store) {
          return store.state.todos.where((todo) => todo.completed).length;
        });
  }
}
