import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/components/stats.dart';
import 'package:mobx_pattern/components/tab_selector.dart';
import 'package:mobx_pattern/components/todo_view.dart';
import 'package:mobx_pattern/components/visibility_filter_component.dart';
import 'package:mobx_pattern/models/tab_state.dart';
import 'package:mobx_pattern/models/todo.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
   HomePage({Key? key}) : super(key: key);
  final _tab= Observable<TabState>(TabState.todos);
  @override
  Widget build(BuildContext context) {
   final  todoList= Provider.of<TodoList>(context);
   print("building HomePage");

   return Observer(

      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("testo"),
            actions: const [VisibilityFilterComponent()],
          ),
          body: _tab.value == TabState.todos ? const TodoView() : const Stats(),
          bottomNavigationBar:  TabSelector( tab: _tab,),
          floatingActionButton: FloatingActionButton(onPressed: () {
            todoList.addTodo(Todo(name:"io",description:"tu",completed: false));
            //Navigator.pushNamed(context, "/addTodo");
          }),
        );
      },
    );
  }
}
