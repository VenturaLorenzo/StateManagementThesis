import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/todo.dart';

int generateId(List<Todo> todos) {
  Random rand = Random();
  int newInt = rand.nextInt(1000) + 2;
  List<int> ids = todos.map((todo) => todo.id).toList();
  while (ids.contains(newInt)) {
    newInt = rand.nextInt(1000) + 2;
  }
  return newInt;
}

bool todoExists(List<Todo> todos, int id) {
  List<Todo> result = todos.where((todo) => todo.id == id).toList();
  return result.isNotEmpty ? true : false;
}
const snackBar = SnackBar(
  content: Text('Todos saved!'),
);