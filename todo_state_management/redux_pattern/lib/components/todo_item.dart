import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/todo.dart';

class TodoItem extends StatelessWidget {
  final ValueChanged<bool?> setCompleted;
  final Todo todo;

  const TodoItem({Key? key, required this.todo, required this.setCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Todo Item");

    return StoreConnector<AppState, _ViewModel>(converter: (store) {
      final Todo t= store.state.todos.firstWhere((element) => element.name==todo.name);
      return _ViewModel(completed: t.completed, text: t.name);
    }, builder: (context, vm) {
      return Row(
        children: [
          Text(vm.text),
          Checkbox(value: vm.completed, onChanged: setCompleted),
        ],
      );
    });
  }
}

class _ViewModel {
  String text;
  bool completed;

  _ViewModel({required this.completed, required this.text});

  @override
  bool operator ==(Object other) {
    return other is _ViewModel &&
        other.text == text &&
        other.completed == completed;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => text.hashCode;
}
