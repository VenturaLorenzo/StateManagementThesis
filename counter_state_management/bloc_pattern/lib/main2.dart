
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<int>(
            stream: counterBloc.outgoingState,
            initialData: counterBloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(snapshot.data.toString());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterBloc.counterEventSink.add(AddEvent(1));
          },
        ),
      ),
    );
  }
}
