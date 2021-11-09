
import 'package:getx_pattern/models/todo.dart';

class TodoRepository {
  List<Todo> todos=[
    Todo(name:  "todo1",description:  "desx", completed: false),
    Todo(name: "todo3", description: "desx", completed: false),
    Todo(name: "todo2", description: "desx", completed: true)
  ];
   Future<List<Todo>> loadTodos() async {

    await Future.delayed(const Duration(seconds: 2));
    return todos ;
  }
 Future<void> saveTodos(List<Todo>todos) async {

    await Future.delayed(const Duration(seconds: 2));
    this.todos= todos; }
}
