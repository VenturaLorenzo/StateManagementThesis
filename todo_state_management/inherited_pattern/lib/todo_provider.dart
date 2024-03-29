import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final void Function(int) onDeleteTodo;
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
      required this.onDeleteTodo,
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
    return (!listEquals(oldWidget.filteredTodos, filteredTodos) ||
        filter != oldWidget.filter);
  }

  @override
  bool updateShouldNotifyDependent() {
    if (changeAffectingTheEntireListOccured) {
      //leads every dependent to rebuild whatever aspect it subscribed to
      return true;
    } else {
      // in case the change is not affecting the entire TodoView
      //check which aspect the dependent subscribed to
      if (dependencies.contains(0)) {
        //if it subscribed to structural changes
        //do not rebuild because the change is not structural
        return false;
      }
      if (todoWithID(Dependencies).changed) {
        //if the todo with id equal to the value in the dependencies changed
        // evaluate to true (rebuild)
        return true;
      }
    }
    //if no previous statements were satisfied return false
    return false;
  }

  @override
  bool updateShouldNotifyDependent(
      TodoInheritedData oldWidget, Set<int> dependencies) {
    if (dependencies.contains(1)) {
      return true;
    }
    bool structuralChange =
        _checkStructuralChange(oldWidget.filteredTodos, filteredTodos);
    if (structuralChange) {
      return true;
    } else {
      if (dependencies.contains(0)) {
        return false;
      }

      if (oldWidget.todos
              .where((element) => element.id == dependencies.first)
              .first !=
          todos.where((element) => element.id == dependencies.first).first) {
        return true;
      }
    }
    return false;
  }

  bool _checkStructuralChange(List<Todo> before, List<Todo> current) {
    //calculate the length of the current filtered list
    int currLen = current.length;
    //calculate the length of the previous filtered list
    int prevLen = before.length;

    bool structureRebuildLen = (currLen != prevLen);
    //check if the two lengths differ
    if (structureRebuildLen) {
      // if they differ a structural change occured
      return true;
    } else {
      //map the current list to a list containing the ids only
      List<int> currIds = current.map((todo) => todo.id).toList();
      //map the previous list to a list containing the ids only
      List<int> prevIds = before.map((todo) => todo.id).toList();
      //check they are the same
      bool sameIds = listEquals(currIds, prevIds);
      if (!sameIds) {
        //if they differ a structural change uccurred
        return true;
      } else {
        // no structural change occured
        return false;
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
    // TodoRepository.saveTodos(todos).then((value) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //});
  }

  void onDeleteTodo(int id) {
    List<Todo> newList = List.from(todos)
      ..removeWhere((element) => element.id == id);

    setState(() {
      todos = newList;
    });
    //TodoRepository.saveTodos(todos).then((value) {
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //});
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
    //TodoRepository.saveTodos(todos).then((value) {
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //});
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
    //TodoRepository.saveTodos(todos).then((value) {
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //});
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
      onDeleteTodo: onDeleteTodo,
      child: widget.child,
    );
  }
}
