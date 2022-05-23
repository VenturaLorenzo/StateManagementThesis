import 'dart:math';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_event.dart';

class HeartRateGenerator {
  HeartRateGenerator(this.bloc);

  HeartRateBloc bloc;
  Random rand = Random();
  bool end = false;
  DateTime startTime = DateTime.now();
  DateTime lastSendTime = DateTime.now();
  int lastSendValue = 80;
  int generatedValues = 0;
  List<int> values = [0,0,0,0,0,0];

  Future<void> generateValues() async {
    while (end != true) {
      if ((generatedValues+1) % 20 == 0) {
        end=true;
        values[0] = rand.nextInt(2);
      }
      if (generatedValues % 10 == 0) {
        values[1] = rand.nextInt(30);
      }
      if (generatedValues % 2 == 0) {
        values[2] = rand.nextInt(300);
      }
      values[3] = rand.nextInt(8);
      int heartRateValue = lastSendValue + (values[3] - 3);
      int timeToWait = values[0] * 10000 + 200 + values[1] * 10 + values[2];
      await Future.delayed(Duration(milliseconds: timeToWait));
      bloc.add(ReceivedHeartRate(
          heartRate: HeartRate(date: DateTime.now(), value: heartRateValue)));
      lastSendTime.add(Duration(milliseconds: timeToWait));
      lastSendValue = heartRateValue;
      generatedValues++;
    }
  }
}