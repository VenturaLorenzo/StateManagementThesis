
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/stats.dart';
import 'components/todo_view.dart';
import 'models/todo_store.dart';

void main() async {
  runApp(Provider<TodoStore>(
      create: (_) => TodoStore()..fetchTodos(),
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
        "/": (context) =>  const Prova(),

      },
    );
  }
}
