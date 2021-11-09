import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:inherited_pattern/repository/todo_repository.dart';

import 'models/todo.dart';

class TodoInheritedData extends InheritedModel<int> {
  const TodoInheritedData(
      {required this.onSetCompleted,
      Key? key,
      required this.todos,
      required this.onAddTodo,
      required Widget child})
      : stats = todos.length,
        super(child: child, key: key);

  final List<Todo> todos;
  final void Function() onAddTodo;
  final void Function(int, bool) onSetCompleted;
  final int stats;

  static TodoInheritedData of(BuildContext context, {required int aspect}) {
    final TodoInheritedData? result =
        InheritedModel.inheritFrom<TodoInheritedData>(context, aspect: aspect);
    assert(result != null, 'No todoScaffold found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInheritedData oldWidget) {

    return !listEquals(oldWidget.todos, todos);
  }

  @override
  bool updateShouldNotifyDependent(
      TodoInheritedData oldWidget, Set<int> dependencies) {

    int currLen = todos.length;
    int prevLen = oldWidget.todos.length;
    List<int> currIds = todos.map((todo) => todo.id).toList();
    List<int> prevIds = oldWidget.todos.map((todo) => todo.id).toList();
    bool sameIds = listEquals(currIds, prevIds);
    bool structureRebuildlen = (dependencies.contains(0) && currLen != prevLen);
    bool structureRebuildcomp = (dependencies.contains(0) && !sameIds);
    List<bool> components = [];
    for (var element in todos) {
      components.add(dependencies.contains(element.id) &&
          !oldWidget.todos.contains(element));
    }
    bool res = components.fold(
        false, (bool previousValue, bool element) => previousValue || element);
    return structureRebuildcomp || structureRebuildlen || res;
  }
}

class TodoProvider extends StatefulWidget {
  const TodoProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  //static TodoInheritedData? of(BuildContext context) {
  // return context.dependOnInheritedWidgetOfExactType<TodoInheritedData>();
  //}

  @override
  _TodoProviderState createState() => _TodoProviderState();
}

class _TodoProviderState extends State<TodoProvider> {
  List<Todo> todos = [];

  @override
  void initState() {
    TodoRepository.loadTodos().then((todos) {
      setState(() {
        this.todos = todos;
      });
    });
    super.initState();
  }

  void onAddTodo() {
    Random rand = Random();
    List<int> ids = todos.map((e) => e.id).toList();
    int newId = rand.nextInt(1000);
    while (ids.contains(newId)) {
      newId = rand.nextInt(1000);
    }
    setState(() {
      Todo newTodo = Todo(
          id: newId,
          name: "Todo " + newId.toString(),
          description: "description " + newId.toString(),
          completed: rand.nextBool());
      List<Todo> newList = List.from(todos);
      newList.add(newTodo);
      todos = List.from(newList);

    });
  }

  void onSetCompleted(int id, bool completed) {
    if (todos.where((element) => element.id == id).isNotEmpty) {
      setState(() {
        todos = todos.map((e) {
          if (e.id == id) {
            return Todo(
                id: id,
                name: e.name,
                description: e.description,
                completed: completed);
          } else {
            return e;
          }
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TodoInheritedData(
      todos: todos,
      onAddTodo: onAddTodo,
      onSetCompleted: onSetCompleted,
      child: widget.child,
    );
  }
}
