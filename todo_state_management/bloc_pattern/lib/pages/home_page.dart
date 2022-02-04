import 'package:bloc_pattern/blocs/tab_bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/components/stats.dart';
import 'package:bloc_pattern/components/tab_selector.dart';
import 'package:bloc_pattern/components/todo_view.dart';
import 'package:bloc_pattern/components/todo_view_with_selector.dart';
import 'package:bloc_pattern/components/visibility_filter_component.dart';
import 'package:bloc_pattern/repository/utility.dart';
import 'package:bloc_pattern/states/tab_state.dart';
import 'package:bloc_pattern/states/todos_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodosState>(
      listener: (context, state) {
        if (state is TodosMutatedState && state.saved == true) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<TabBloc, TabState>(builder: (context, tabState) {
        print("building: HomePage");

        return Scaffold(
            appBar: AppBar(
              title: const Text("TodoApp"),
              actions: [
                tabState == TabState.todos
                    ? const VisibilityFilterSelector()
                    : Container()
              ],
            ),
            body: tabState == TabState.todos
                ? const TodoViewSelector()
                : const Stats(),
            bottomNavigationBar: const TabSelector(),
            floatingActionButton: tabState == TabState.todos
                ? FloatingActionButton(
                    child: const Icon(Icons.plus_one),
                    onPressed: () {
                      Navigator.pushNamed(context, "/addTodo");
                    })
                : Container());
      }),
    );
  }
}
