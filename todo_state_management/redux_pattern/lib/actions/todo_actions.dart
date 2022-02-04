import '../models/todo.dart';

class AddTodoAction {
  final String name;
  final String desc;

  AddTodoAction(this.name, this.desc);
}

class UpdateTodoAction{
  final String name;
  final String desc;
  final int id;

  UpdateTodoAction(this.name,this.desc,this.id);
}
class SetCompletedTodoAction {
  final int id;
  final bool completed;

  SetCompletedTodoAction(this.id, this.completed);
}
class DeleteTodoAction{
  final int id;

  DeleteTodoAction(this.id);
}