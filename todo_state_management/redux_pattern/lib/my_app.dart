import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_pattern/actions/app_state_actions.dart';
import 'package:redux_pattern/pages/add_todo_page.dart';
import 'package:redux_pattern/pages/home_page.dart';

import 'models/app_state.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Material App");
    return StoreProvider(
      store: store,
      child: MaterialApp(initialRoute: "/",
        routes: {
          "/": (context) => HomePage(onInit: (){
            store.dispatch(LoadTodoAction());
            },),
          "/addtodo":(context) {

            var rng = Random();


            return  AddTodoPage(desc: rng.nextInt(10000).toString(),name: rng.nextInt(2345253).toString());},
        },
      ),
    );

  }
}

