import '../models/todo.dart';

class AddTodoAction {
final Todo newTodo;
AddTodoAction(this.newTodo);
}
class RemoveTodoAction{
  final Todo todo;
   RemoveTodoAction(this.todo);
}

class SetTodoAction{
  final Todo todo;
  SetTodoAction(this.todo);
}