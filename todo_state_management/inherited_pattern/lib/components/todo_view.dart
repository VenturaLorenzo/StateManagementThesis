
import 'package:flutter/cupertino.dart';
import 'package:inherited_pattern/components/todo_item.dart';
import 'package:inherited_pattern/models/todo.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';
import 'package:inherited_pattern/todo_provider.dart';

class TodoView extends StatelessWidget{
  final VisibilityFilter filter;
  const TodoView({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building TodoView");
    final List<Todo> filteredList;
    final List<Todo> todos = TodoInheritedData.of(context,aspect: 0)!.todos;
    switch (filter) {
      case VisibilityFilter.notCompleted:
            filteredList= todos.where((element) => element.completed==false).toList();
            break;
      case VisibilityFilter.completed:
        filteredList= todos.where((element) => element.completed==true).toList();
        break;
      case VisibilityFilter.all:
        filteredList=todos;
        break;
    }

    return  ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return TodoItem(
                id:todos.elementAt(index).id,

              );
            },
          );


  }
}
