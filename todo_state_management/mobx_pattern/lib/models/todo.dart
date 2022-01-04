import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class Todo = _Todo with _$Todo;

abstract class _Todo with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  String description;
  @observable
  bool completed;


  _Todo(
      {required this.name,
      required this.completed,
      required this.description,
      required this.id});

  @override
  String toString() {
    return 'Todo {  name: $name , completed: $completed }';
  }
}
