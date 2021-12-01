import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc_observer.dart';
import 'package:bloc_pattern/myapp.dart';
import 'package:bloc_pattern/repository/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/todos_bloc.dart';
import 'events/todos_event.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider<TodoBloc>(
      create: (context) => TodoBloc()..add(LoadTodosEvent()),
      child: const MyApp()));
}
