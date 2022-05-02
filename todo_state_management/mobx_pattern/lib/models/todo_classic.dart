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
  String toString() {
    return 'Todo {  name: $name }';
  }

  @override
  bool operator ==(Object other) {
    return (other is Todo) &&
        other.name == name &&
        other.description == description &&
        other.completed == completed &&
        id == other.id;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode;
}
