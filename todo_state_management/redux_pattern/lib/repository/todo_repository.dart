import 'package:redux_pattern/models/todo.dart';

class TodoRepository {
  static Future<List<Todo>> loadTodos() async {

    await Future.delayed(const Duration(seconds: 2));
    return [
    Todo(name:  "todo1",description:  "desx", completed: false),
    Todo(name: "todo3", description: "desx", completed: false),
    Todo(name: "todo2", description: "desx", completed: true)
    ];
  }
}
