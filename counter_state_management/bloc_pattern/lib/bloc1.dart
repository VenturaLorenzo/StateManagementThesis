import 'package:bloc/bloc.dart';

import 'bloc.dart';

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