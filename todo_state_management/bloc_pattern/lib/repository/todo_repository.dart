import 'dart:math';

import 'package:bloc_pattern/models/todo.dart';

class TodoRepository {
  static Future<List<Todo>> loadTodos() async {
    Random rand = Random();
    List<Todo> todos = [];
    List<int> ids = [];
    while (ids.length < 6) {
      int newInt = rand.nextInt(1000) + 2;
      if (!ids.contains(newInt)) {
        ids.add(newInt);
      }
    }
    todos = ids
        .map((number) => Todo(
            id: number,
            name: "Todo " + number.toString(),
            description: "description " + number.toString(),
            completed: rand.nextBool()))
        .toList();

    await Future.delayed(const Duration(seconds: 2));
    return todos;
  }

  static Future<void> saveTodos(List<Todo> todos) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
