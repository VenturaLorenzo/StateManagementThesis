import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  //use Provider to dispatch the state in the subtree
  runApp(Provider<Counter>(
    //create the initial state
    create: (context) => Counter(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //retrieve the counter using the of method
    final Counter counter = Provider.of<Counter>(context);
    return MaterialApp(
      home: Scaffold(
        // wrap the Text widget inside a Observer widget to
        // automatically rebuild after a state change
        body: Observer(builder: (context) {
          //access the counter value
          return Text(counter.double.toString());
        }),
        floatingActionButton: FloatingActionButton(
          //increment the counter value
          onPressed: ()=>counter.increment(1),
        ),
      ),
    );
  }
}
