import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/todo_actions.dart';
import 'package:redux_pattern/components/todo_item.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_pattern/models/todo.dart';
import 'package:redux_pattern/models/visibility_filter.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building TodoView");

    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        builder: (context, vm) {
          return ListView.builder(
            itemCount: vm.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: vm.todos.elementAt(index),
                setCompleted: (completed) {
                  Todo todo = vm.todos.elementAt(index);
                  StoreProvider.of<AppState>(context).dispatch(SetTodoAction(
                      Todo(
                          name: todo.name,
                          description: todo.description,
                          completed: completed ?? true)));
                },
              );
            },
          );
        },
        converter: (store) {
          return _ViewModel(
              todos: store.state.todos.where((todo) {
            switch (store.state.visibilityFilter) {
              case VisibilityFilter.notCompleted:
                return !todo.completed;
              case VisibilityFilter.completed:
                return todo.completed;
              case VisibilityFilter.all:
              default:
                return true;
            }
          }).toList());
        });
  }
}

class _ViewModel {
  final List<Todo> todos;

  _ViewModel({required this.todos});

  @override
  bool operator ==(Object other) {
    return ((other is _ViewModel) &&
        todos.length == other.todos.length &&
        todos.every(
            (todo) => other.todos.any((element) => todo.name == element.name)));
  }

  @override
  // TODO: implement hashCode
  int get hashCode => todos.hashCode;
}
