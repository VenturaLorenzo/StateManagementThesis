import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final int id;
  final String name;
  final String description;
  final bool completed;

  const Todo(
      {required this.id,
      required this.name,
      required this.description,
      required this.completed});

  @override
  bool operator ==(Object other) {
    return (other is Todo) &&
        other.description == description &&
        other.name == name &&
        other.id == id &&
        other.completed == completed;
  }

  @override
  String toString() {
    return "{ id: $id  completed: $completed ,$description,$name}";
  }

  @override
  // TODO: implement hashCode
  int get hashCode => id;

}
