import 'package:flutter/material.dart';
import 'package:inherited_pattern/pages/home_page.dart';
import 'package:inherited_pattern/todo_provider.dart';
import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoProvider(
        child: Builder(
          builder: (context) {
            return HomePage();
          },
        ),
      ),
    );
  }
}
