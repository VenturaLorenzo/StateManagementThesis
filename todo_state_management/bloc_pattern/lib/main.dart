
import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/barrels/todo_state_management.dart';
import 'package:bloc_pattern/bloc_observer.dart';
import 'package:bloc_pattern/myapp.dart';
import 'package:bloc_pattern/repository/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp( BlocProvider<TodoBloc>(create:(context)=> TodoBloc()..add(LoadTodosEvent()),child: const MyApp()));
}
