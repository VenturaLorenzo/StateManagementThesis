import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc1.dart';


void main() async {
  /// Create a `CounterBloc` instance.
  final bloc = CounterBloc();
  bloc.
  // use a BlocProvider to provide the bloc in the subtree
  runApp(BlocProvider<CounterBloc>(
    create: (context) => bloc,
    child: const MyApp(),
  ));
}

/// The events which `CounterBloc` will react to.
abstract class CounterEvent {}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //use a BlocBuilder
        body: BlocBuilder<CounterBloc, int>(builder: (context, counterValue) {
          //access the state in the builder and print the counter value
          return Text(counterValue.toString());
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          //add an action incrementing the counter by one to the stream
          BlocProvider.of<CounterBloc>(context).add(CounterIncrement(1));
        }),
      ),
    );
  }
}
