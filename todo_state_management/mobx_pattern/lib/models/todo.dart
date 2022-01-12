import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'todo.g.dart';


class Todo = _Todo with _$Todo;

@immutable
abstract class _Todo with Store{

   final int id;
  @observable
   String name;
  @observable
   String description;
  @observable
   bool completed;

  _Todo(
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
