import 'package:activity_state_management/bloc/UI/home/bloc_navigator.dart';
import 'package:activity_state_management/bloc/UI/home/bloc_root.dart';
import 'package:activity_state_management/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const BlocRoot(subRoute: "home")));
}
