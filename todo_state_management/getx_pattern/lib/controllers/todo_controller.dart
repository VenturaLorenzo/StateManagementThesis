import 'package:get/get.dart';
import 'package:getx_pattern/models/tab_state.dart';
import 'package:getx_pattern/models/todo.dart';
import 'package:getx_pattern/models/visibility_filter.dart';
import 'package:getx_pattern/repository/todo_repository.dart';

class TodoController extends GetxController {
  RxList<Todo> todos = RxList<Todo>();
  Rx<VisibilityFilter> filter = VisibilityFilter.all.obs;
  Rx<TabState> tab = TabState.todos.obs;

  String get stats {
    return todos.length.toString() + " " + filteredTodos.length.toString();
  }

  @override
  Future<void> onInit() async {
    TodoRepository repo = TodoRepository();
    todos.value = (await repo.loadTodos());
    // super.onInit();
  }

  List<Todo> get filteredTodos {
    switch (filter.value) {
      case VisibilityFilter.all:
        return todos;
      case VisibilityFilter.completed:
        return todos.where((element) => element.completed.value).toList();
      case VisibilityFilter.notCompleted:
        return todos.where((element) => !element.completed.value).toList();
    }
  }
}
