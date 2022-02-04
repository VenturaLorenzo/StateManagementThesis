
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/todo_provider.dart';

import 'components/stats.dart';
import 'components/todo_view.dart';

void main() async {
  runApp( TodoProvider(child: Builder(
    builder: (context) {
      return MyApp1();
    }
  )));
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
