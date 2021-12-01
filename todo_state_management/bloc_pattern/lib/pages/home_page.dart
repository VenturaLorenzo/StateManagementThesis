
import 'package:bloc_pattern/blocs/tab_bloc.dart';
import 'package:bloc_pattern/components/stats.dart';
import 'package:bloc_pattern/components/tab_selector.dart';
import 'package:bloc_pattern/components/todo_view.dart';
import 'package:bloc_pattern/components/visibility_filter_component.dart';
import 'package:bloc_pattern/states/tab_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: HomePage");

    return BlocBuilder<TabBloc, TabState>(builder: (context, tabState) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("TodoApp"),
            actions: [
              tabState == TabState.todos
                  ? VisibilityFilterSelector()
                  : Container()
            ],
          ),
          body: tabState == TabState.todos ? const TodoView() : const Stats(),
          bottomNavigationBar: const TabSelector(),
          floatingActionButton: tabState == TabState.todos
              ? FloatingActionButton(
                  child: const Icon(Icons.plus_one),
                  onPressed: () {
                    Navigator.pushNamed(context, "/addTodo");
                  })
              : Container());
    });
  }
}
