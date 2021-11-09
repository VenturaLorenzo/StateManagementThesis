import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/components/visibility_filter_component.dart';
import 'package:mobx_pattern/models/todo.dart';
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
    return completed.toString() + len.toString();
  }
  @action
  void changeFilter(VisibilityFilter filter) {
    this.filter = filter;
  }


  @action
  void addTodo(Todo todo) {

    todos.add(todo);
    todos=todos.toList();

  }

  @action
  Future<void> fetchTodos() async {
    todos = await repo.loadTodos();
    //todos.addAll( await repo.loadTodos());
  }

  @action
  Future<void> saveTodos() async {
    await repo.saveTodos(todos);
  }
  final TodoRepository repo;

  _TodoList({required this.repo});

}
