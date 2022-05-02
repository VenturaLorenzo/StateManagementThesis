import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux_pattern/components/todo_item.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_pattern/models/todo.dart';
import 'package:redux_pattern/models/visibility_filter.dart';
import 'package:redux_pattern/selectors/selectors.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        builder: (context, vm) {
          print("Building TodoView");
          return ListView.builder(
            itemCount: vm.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                id: vm.todos.elementAt(index).id,
              );
            },
          );
        },
        converter: (store) {
          return _ViewModel(todos: filteredTodosSelector(store.state));
        });
  }
}

class _ViewModel {
  final List<Todo> todos;

  _ViewModel({required this.todos});

  /*@override
  bool operator ==(Object other) {
    return ((other is _ViewModel) &&
        todos.length == other.todos.length &&
        todos.every(
            (todo) => other.todos.any((element) => todo.id  == element.id)));
  }*/
  @override
  bool operator ==(Object other) {
    if(other is _ViewModel) {
      List<int> ids = todos.map((todo) => todo.id).toList();
      List<int> otherIds = other.todos.map((todo) => todo.id).toList();

      return listEquals(ids,otherIds);
    }else{
      return false;
    }
  }

  @override
  // TODO: implement hashCode
  int get hashCode => todos.hashCode;
}
