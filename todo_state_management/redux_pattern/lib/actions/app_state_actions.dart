import 'package:redux_pattern/models/todo.dart';

class LoadTodoAction{
  @override
  String toString(){
    return "loadTodoAction";
  }
}
class LoadTodoSucceededAction{
  List<Todo> todos;
   LoadTodoSucceededAction(this.todos);
}