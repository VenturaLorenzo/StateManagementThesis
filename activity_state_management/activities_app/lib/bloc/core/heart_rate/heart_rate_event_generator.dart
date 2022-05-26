import 'dart:async';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_event.dart';
import 'package:activity_state_management/heart_rate_generator.dart';

import 'core/heart_rate.dart';

class HeartRateEventGenerator {
  HeartRateEventGenerator({required this.bloc});

  final HeartRateBloc bloc;
  final HeartRateGenerator generator= HeartRateGenerator();
  late StreamSubscription<HeartRate> subscription;
  void start() {
    subscription= generator.outgoingState.listen((HeartRate heartRate) {
      bloc.add(ReceivedHeartRate(heartRate: heartRate));
    });
    generator.generateValues();
  }
  void stop(){
    subscription.cancel();
    generator.stop();
  }
}
