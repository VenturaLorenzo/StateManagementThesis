import 'dart:math';

import 'package:bloc_pattern/pages/add_todo_page.dart';
import 'package:bloc_pattern/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/filtered_todo_bloc.dart';
import 'blocs/stats_bloc.dart';
import 'blocs/tab_bloc.dart';
import 'blocs/todos_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: MATERIAL-APP");
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MultiBlocProvider(providers: [
              BlocProvider<TabBloc>(create: (context) => TabBloc()),
              BlocProvider<StatsBloc>(
                  create: (context) =>
                      StatsBloc(todoBloc: BlocProvider.of<TodoBloc>(context))),
              BlocProvider<FilteredTodoBloc>(
                  create: (context) =>
                      FilteredTodoBloc(todoBloc: BlocProvider.of<TodoBloc>(context))),
            ], child: const HomePage()),
        "/addTodo": (context) {
          var rng = Random();

          return AddTodoPage(
              desc: rng.nextInt(10000).toString(),
              name: rng.nextInt(2345253).toString());
        },
      },
    );
  }
}
