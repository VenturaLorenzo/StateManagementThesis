import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';
import 'package:inherited_pattern/repository/todo_repository.dart';
import 'package:inherited_pattern/repository/utility.dart';

import 'models/todo.dart';

List<Todo> filterTodo(List<Todo> todos, filter) {
  List<Todo> filteredList = [];
  switch (filter) {
    case VisibilityFilter.notCompleted:
      filteredList =
          todos.where((element) => element.completed == false).toList();
      break;
    case VisibilityFilter.completed:
      filteredList =
          todos.where((element) => element.completed == true).toList();
      break;
    case VisibilityFilter.all:
      filteredList = todos;
      break;
  }
  return filteredList;
}

class TodoInheritedData extends InheritedModel<int> {
  final List<Todo> todos;
  final List<Todo> filteredTodos;
  final void Function(String, String) onAddTodo;
  final void Function(int, bool) onSetCompleted;
  final void Function(int, String, String) onUpdateTodo;
  final void Function(VisibilityFilter) onChangeFilter;
  final int stats;
  final VisibilityFilter filter;

  TodoInheritedData(
      {required this.onSetCompleted,
      Key? key,
      required this.todos,
      required this.onUpdateTodo,
      required this.onChangeFilter,
      required this.onAddTodo,
      required this.filter,
      required Widget child})
      : stats = todos.where((todo) => todo.completed == true).length,
        filteredTodos = filterTodo(todos, filter),
        super(child: child, key: key);

  static TodoInheritedData of(BuildContext context, {required int aspect}) {
    final TodoInheritedData? result =
        InheritedModel.inheritFrom<TodoInheritedData>(context, aspect: aspect);
    assert(result != null, 'No TodoInheritedData found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoInheritedData oldWidget) {
    return !listEquals(oldWidget.filteredTodos, filteredTodos);
  }

  @override
  bool updateShouldNotifyDependent(
      TodoInheritedData oldWidget, Set<int> dependencies) {

    int currLen = filteredTodos.length;
    int prevLen = oldWidget.filteredTodos.length;
    bool structureRebuildlen = (dependencies.contains(0) && currLen != prevLen);
    if (structureRebuildlen == true) {
      return true;
    } else {
      List<int> currIds = filteredTodos.map((todo) => todo.id).toList();
      List<int> prevIds =
          oldWidget.filteredTodos.map((todo) => todo.id).toList();
      bool sameIds = listEquals(currIds, prevIds);
      bool structureRebuildcomp = (dependencies.contains(0) && !sameIds);
      if (structureRebuildcomp == true) {
        return true;
      } else {
        List<bool> components = [];
        for (var element in filteredTodos) {
          components.add(dependencies.contains(element.id) &&
              !oldWidget.filteredTodos.contains(element));
        }
        bool res = components.fold(false,
            (bool previousValue, bool element) => previousValue || element);
        print("sto eseguento per il widget ${dependencies.first} returning $res");
        return res;
      }
    }
  }
}

class TodoProvider extends StatefulWidget {
  const TodoProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _TodoProviderState createState() => _TodoProviderState();
}

class _TodoProviderState extends State<TodoProvider> {
  List<Todo> todos = [];
  VisibilityFilter filter = VisibilityFilter.all;

  @override
  void initState() {
    TodoRepository.loadTodos().then((todos) {
      setState(() {
        this.todos = todos;
      });
    });
    super.initState();
  }

  void onChangeFilter(VisibilityFilter filter) {
    setState(() {
      this.filter = filter;
    });
  }

  void onAddTodo(String name, String desc) {
    //generate a new unique id
    int newId = generateId(todos);
    //create the new todo
    Todo newTodo = Todo(
        id: newId,
        name: name,
        description: desc + " " + newId.toString(),
        completed: false);
    //perform the state change
    List<Todo> newList = List.from(todos);
    newList.add(newTodo);
    setState(() {
      todos = newList;
    });
  }

  void onUpdateTodo(int id, String newName, String newDesc) {
    //control the todo's existance
    assert(todoExists(todos, id) == true, 'No todo with id : $id');
    //create a new list with the updated todo
    List<Todo> newTodosList = todos.map((todo) {
      if (todo.id == id) {
        return Todo(
            completed: todo.completed,
            description: newDesc,
            name: newName,
            id: todo.id);
      } else {
        return todo;
      }
    }).toList();
    //update the state
    setState(() {
      todos = newTodosList;
    });
  }

  void onSetCompleted(int id, bool completed) {
    //control the todo's existance
    assert(todoExists(todos, id) == true, 'No todo with id : $id');
    //change the state
    setState(() {
      todos = todos.map((todo) {
        if (todo.id == id) {
          return Todo(
              id: id,
              name: todo.name,
              description: todo.description,
              completed: completed);
        } else {
          return todo;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TodoInheritedData(
      todos: todos,
      onChangeFilter: onChangeFilter,
      onAddTodo: onAddTodo,
      onSetCompleted: onSetCompleted,
      onUpdateTodo: onUpdateTodo,
      filter: filter,
      child: widget.child,
    );
  }
}
