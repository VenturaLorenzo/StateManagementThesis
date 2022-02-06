import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  /// Create a `CounterBloc` instance.
  final bloc = CounterBloc();
  // use a BlocProvider to provide the bloc in the subtree
  runApp(BlocProvider<CounterBloc>(
    create: (context) => bloc,
    child: const MyApp(),
  ));
}

/// The events which `CounterBloc` will react to.
abstract class CounterEvent {}

/// Notifies bloc to increment state.
class CounterIncrement extends CounterEvent {
  //value to be increment with
  final int value;

  CounterIncrement(this.value);
}

/// A `CounterBloc` which handles converting `CounterEvent`s into `int`s.
class CounterBloc extends Bloc<CounterEvent, int> {
  /// The initial state of the `CounterBloc` is 0.
  CounterBloc() : super(0);

  /// and a new state is emitted via `emit`.
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    /// When a `CounterIncrement` event is added,
    if (event is CounterIncrement) {
      /// the current `state` of the bloc is accessed via the `state` property
      // and a new state is emitted
      yield state + event.value;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //use a StoreBuilder
        body: BlocBuilder<CounterBloc, int>(builder: (context, counterValue) {
          //access the store in the builder to print the counter value
          return Text(counterValue.toString());
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          //dispatch an action incrementing the counter by one
          BlocProvider.of<CounterBloc>(context).add(CounterIncrement(1));
        }),
      ),
    );
  }
}
