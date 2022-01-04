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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _tab = Observable<TabState>(TabState.todos);

  @override
  Widget build(BuildContext context) {
    print("building HomePage");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: const [VisibilityFilterComponent()],
      ),
      body: Observer(builder: (_) {
        return _tab.value == TabState.todos ? const TodoView() : const Stats();
      }),
      bottomNavigationBar: TabSelector(
        tab: _tab,
      ),
      floatingActionButton: Observer(builder: (context) {
        return _tab.value == TabState.todos
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/addTodo");
                },
                child: const Icon(Icons.plus_one),
              )
            : Container();
      }),
    );
  }
}
