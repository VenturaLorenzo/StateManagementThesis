
import 'dart:async';

class CounterBloc {
  int value = 0; // initial state

  // broadcasting stream so it can be used multiple times
  final _controlStateController = StreamController<int>.broadcast();

  StreamSink<int> get _incomingValue => _controlStateController.sink;

  Stream<int> get outgoingState => _controlStateController.stream;



  final StreamController<CounterEvent> _counterEventController = StreamController<CounterEvent>.broadcast();

  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapValuesToState);
  }

  void _mapValuesToState(CounterEvent event) {
    if (event is AddEvent) {
      value=value+event.value;
      _incomingValue.add(value);
    }
  }

  void dispose() {
    _controlStateController.close();
    _counterEventController.close();
  }
}

abstract class CounterEvent {}

class AddEvent extends CounterEvent {
  final int value;

  AddEvent(this.value);
}

