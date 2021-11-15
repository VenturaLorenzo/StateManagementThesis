import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/components/stats.dart';
import 'package:inherited_pattern/components/tab_selector.dart';
import 'package:inherited_pattern/components/todo_view.dart';
import 'package:inherited_pattern/components/visibility_filter_component.dart';
import 'package:inherited_pattern/models/tab_state.dart';
import '../todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabState tab = TabState.todos;

  void onTabChange(int index) {
    setState(() {
      tab = TabState.values.elementAt(index);
    });
    Future.delayed(const Duration(seconds: 1))
        .then((value) => print("---------------------"));
  }

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              tab == TabState.todos
                  ? const VisibilityFilterComponent()
                  : Container()
            ],
            title: const Text("Todo App"),
          ),
          body: tab == TabState.todos ? const TodoView() : const Stats(),
          bottomNavigationBar: TabSelector(
            currTab: tab,
            onTabChange: onTabChange,
          ),
          floatingActionButton: tab == TabState.todos
              ? FloatingActionButton(
                  child: const Icon(Icons.plus_one),
            onPressed: () {
              Navigator.pushNamed(context, "/addTodo",
                  arguments:
                      TodoInheritedData.of(context, aspect: 1).onAddTodo);

              Future.delayed(const Duration(seconds: 1))
                  .then((value) => print("---------------------"));
            },
          ) : null,
        );
      }),
    );
  }
}
