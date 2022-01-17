import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/visibility_filter.dart';
import 'package:mobx_pattern/repository/todo_repository.dart';
import 'package:mobx_pattern/repository/utility.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
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
        return completedTodos;
      case VisibilityFilter.notCompleted:
        return pendingTodos;
    }
  }

  @computed
  int get len => todos.length;

  @computed
  int get completed => completedTodos.length;

  @computed
  int get pending => pendingTodos.length;

  @computed
  String get stats {
    return completed.toString();
  }


  @computed
  List<Todo> get completedTodos =>
      todos.where((element) => element.completed).toList();

  @computed
  List<Todo> get pendingTodos =>
      todos.where((element) => !element.completed).toList();

  @action
  void changeFilter(VisibilityFilter filter) {
    this.filter = filter;
  }

  @action
  void updateTodo(int id, String name, String desc) {
    assert(todoExists(todos,id) != null, 'No todo with id : $id');
    Todo todo=todos.where((element) => element.id==id).first;
    todo.name=name;
    todo.description=desc;
  }

  @action
  void setCompleted(int id, bool completed) {
    //check the todo's existance
    assert(todoExists(todos,id) ==true, 'No todo with id : $id');
    todos.where((element) => element.id==id).first.completed=completed;
  }

  @action
  void addTodo(String name, String desc) {
    //generate a new id
    int newId = generateId(todos);
    //create a new todo instance
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
    todos = await TodoRepository.loadTodos();
  }

  @action
  Future<void> saveTodos() async {
    await TodoRepository.saveTodos(todos);
  }
}
