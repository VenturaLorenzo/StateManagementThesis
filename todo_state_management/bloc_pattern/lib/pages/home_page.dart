import 'package:bloc_pattern/barrels/todo_filtered_state_management.dart';
import 'package:bloc_pattern/barrels/todo_state_management.dart';
import 'package:bloc_pattern/blocs/stats_bloc.dart';
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

    return  Scaffold(
          appBar: AppBar(
            title: const Text("testo"),
            actions: const [VisibilityFilterComponent()],
          ),
          body: BlocBuilder<TabBloc, TabState>(builder: (context , tabState){

            return tabState == TabState.todos ? const TodoView() : const Stats();
          },),
          bottomNavigationBar: const TabSelector(),
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, "/addTodo");
          }),
        );

  }
}
