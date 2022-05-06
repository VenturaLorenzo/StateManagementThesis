import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/components/visibility_filter_component.dart';
import 'package:mobx_pattern/models/todo_classic.dart';
import 'package:mobx_pattern/models/visibility_filter.dart';
import 'package:mobx_pattern/repository/todo_repository.dart';

part 'todo_list.g.dart';

class TodoList = _TodoList with _$TodoList;

abstract class _TodoList with Store {
  @observable
  List<Todo> todos = [];

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  List<Todo> get filteredTodos {
    switch (filter) {
      case VisibilityFilter.all:
        return todos;
      case VisibilityFilter.completed:
        return todos.where((element) => element.completed).toList();
      case VisibilityFilter.notCompleted:
        return todos.where((element) => !element.completed).toList();
    }
  }

  @computed
  int get len => todos.length;

  @computed
  int get completed =>
      todos.where((element) => element.completed).toList().length;

  @computed
  String get stats {
    return completed.toString();
  }

  @action
  void changeFilter(VisibilityFilter filter) {
    this.filter = filter;
  }

  @action
  void updateTodo(int id, String name, String desc) {
    assert(todoExists(id) != null, 'No todo with id : $id');
    todos.map((element) {
      if (element.id == id) {
        return Todo(
            completed: element.completed,
            description: desc,
            name: name,
            id: element.id);
      } else {
        return element;
      }
    });
    todos = todos.toList();
  }

  @action
  void setCompleted(int id, bool completed) {
    assert(todoExists(id) != null, 'No todo with id : $id');
    todos=todos.map((element) {
      if (element.id == id) {
        return Todo(
            completed: completed,
            description: element.description,
            name: element.name,
            id: element.id);
      } else {
        return element;
      }
    }).toList();
  }

  Todo? todoExists(int id) {
    List<Todo> result = todos.where((element) => element.id == id).toList();
    return result.isNotEmpty ? result.first : null;
  }

  @action
  void addTodo(String name, String desc) {
    Random rand = Random();
    List<int> ids = todos.map((e) => e.id).toList();
    int newId = rand.nextInt(1000) + 2;
    while (ids.contains(newId)) {
      newId = rand.nextInt(1000) + 2;
    }
    Todo newTodo = Todo(
        id: newId,
        name: name,
        description: desc + " " + newId.toString(),
        completed: false);

    todos.add(newTodo);
    todos = todos.toList();
  }

  @action
  Future<void> fetchTodos() async {
    //todos = await TodoRepository.loadTodos();
    //todos.addAll( await repo.loadTodos());
  }

  @action
  Future<void> saveTodos() async {
   // await TodoRepository.saveTodos(todos);
  }
}
