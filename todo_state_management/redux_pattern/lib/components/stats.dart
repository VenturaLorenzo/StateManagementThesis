import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/selectors/selectors.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      builder: (context, completed) {
        print("Building Stats");
        return Center(child: Text(completed.toString()));
      },
      converter: (store) {
        return completedTodosSelector(store.state).length;
      },
    );
  }
}
