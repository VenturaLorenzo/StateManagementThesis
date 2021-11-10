import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/components/stats.dart';
import 'package:inherited_pattern/components/tab_selector.dart';
import 'package:inherited_pattern/components/todo_view.dart';
import 'package:inherited_pattern/components/visibility_filter_component.dart';
import 'package:inherited_pattern/models/tab_state.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';
import '../todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<TabState> tab = ValueNotifier<TabState>(TabState.todos);

  void onTabChange(int index) {
    tab.value = TabState.values.elementAt(index);
    Future.delayed(const Duration(seconds: 1))
        .then((value) => print("---------------------"));
  }

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                ValueListenableBuilder<TabState>(
                    valueListenable: tab,
                    builder: (context, value, _) {
                      return value == TabState.todos
                          ? const VisibilityFilterComponent()
                          : Container();
                    })
              ],
              title: const Text("Todo App"),
            ),
            body: ValueListenableBuilder<TabState>(
                valueListenable: tab,
                builder: (context, value, _) {
                  return value == TabState.todos ? const TodoView() : const Stats();
                }),
            bottomNavigationBar: ValueListenableBuilder<TabState>(
                valueListenable: tab,
                builder: (context, value, _) {
                  return TabSelector(
                    currTab: value,
                    onTabChange: onTabChange,
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.plus_one),
              onPressed: () {

                TodoInheritedData.of(context, aspect: 0).onAddTodo();


                Future.delayed(const Duration(seconds: 1))
                    .then((value) => print("---------------------"));
              },
            ),
          );
        }
      ),
    );
  }
}
