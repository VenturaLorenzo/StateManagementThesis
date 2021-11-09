import 'package:bloc_pattern/models/todo.dart';

class TodoRepository {
   Future<List<Todo>> loadTodos() async {

    await Future.delayed(const Duration(seconds: 2));
    return [
    const Todo(name:  "todo1",description:  "desx", completed: false, id: 1),
    const Todo(name: "todo3", description: "desx", completed: false, id: 2),
    const Todo(name: "todo2", description: "desx", completed: true, id: 3)
    ];
  }
}
