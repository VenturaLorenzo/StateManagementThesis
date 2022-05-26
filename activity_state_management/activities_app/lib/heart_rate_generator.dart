import 'dart:async';
import 'dart:math';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';

class HeartRateGenerator {
  HeartRateGenerator();
  final StreamController<HeartRate> _controller= StreamController();
  final Random _rand = Random();
  bool _end = false;
  DateTime _startTime = DateTime.now();
  final DateTime _lastSendTime = DateTime.now();
  int _lastSendValue = 80;
  int _generatedValues = 0;
  Stream<HeartRate> get outgoingState => _controller.stream;
  final List<int> _values = [0,0,0,0,0,0];


  Future<void> generateValues() async {
    while (_end != true) {
      if ((_generatedValues+1) % 20 == 0) {
        _values[0] = _rand.nextInt(2);
      }
      if (_generatedValues % 10 == 0) {
        _values[1] = _rand.nextInt(30);
      }
      if (_generatedValues % 2 == 0) {
        _values[2] = _rand.nextInt(300);
      }
      _values[3] = _rand.nextInt(8);
      int heartRateValue = _lastSendValue + (_values[3] - 3);
      int timeToWait = _values[0] * 10000 + 200 + _values[1] * 10 + _values[2];
      await Future.delayed(Duration(milliseconds: timeToWait));
      _controller.sink.add(HeartRate(value: heartRateValue, date: DateTime.now()));
      _lastSendTime.add(Duration(milliseconds: timeToWait));
      _lastSendValue = heartRateValue;
      _generatedValues++;
    }
  }
  void stop(){
    _end= true;
  }
}