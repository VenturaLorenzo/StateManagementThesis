import 'dart:math';
import 'package:inherited_pattern/models/todo.dart';
import 'package:inherited_pattern/repository/utility.dart';

class TodoRepository {
  static Future<List<Todo>> loadTodos() async {
    List<Todo> todos = [];
    Random rand = Random();
    while (todos.length < 6) {
      int newInt = generateId(todos);
      todos.add(Todo(
          id: newInt,
          name: "Todo " + newInt.toString(),
          description: "description " + newInt.toString(),
          completed: rand.nextBool()));
    }

    await Future.delayed(const Duration(seconds: 2));
    return todos;
  }

  static Future<bool> saveTodos(List<Todo> todos) async {

    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
