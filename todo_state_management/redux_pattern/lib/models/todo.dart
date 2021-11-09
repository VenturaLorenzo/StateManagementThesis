import 'package:flutter/cupertino.dart';

@immutable
class Todo {

  final String name;
  final String description;
  final bool completed;

  const Todo({required this.name ,required this.description,required this.completed});

}