import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc_observer.dart';
import 'package:bloc_pattern/components/stats.dart';
import 'package:bloc_pattern/components/todo_view.dart';
import 'package:bloc_pattern/myapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/filtered_todo_bloc.dart';
import 'blocs/stats_bloc.dart';
import 'blocs/tab_bloc.dart';
import 'blocs/todos_bloc.dart';
import 'events/todos_event.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider<TodoBloc>(
      create: (context) => TodoBloc()..add(LoadTodosEvent()),
      child: const MyApp1()));
}
 class Prova extends StatelessWidget {
   const Prova({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(body: Column(children:  [const Stats(),Container(height: 200,child: const TodoView())],));
   }
 }
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MultiBlocProvider(providers: [
          BlocProvider<TabBloc>(create: (context) => TabBloc()),
          BlocProvider<StatsBloc>(
              create: (context) =>
                  StatsBloc(todoBloc: BlocProvider.of<TodoBloc>(context))),
          BlocProvider<FilteredTodoBloc>(
              create: (context) => FilteredTodoBloc(
                  todoBloc: BlocProvider.of<TodoBloc>(context))),
        ], child: const Prova()),

      },
    );
  }
}
