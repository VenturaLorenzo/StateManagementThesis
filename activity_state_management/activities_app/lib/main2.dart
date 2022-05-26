import 'dart:convert';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/heart_rate_event_generator.dart';
import 'package:activity_state_management/bloc/core/heart_rate/heart_rate_store/heart_rate_store_bloc.dart';
import 'package:activity_state_management/heart_rate_generator.dart';
import 'package:http/http.dart';

void main() async {
  HeartRateGenerator generator=HeartRateGenerator();
  HeartRateBloc bloc= HeartRateBloc();
  HeartRateStoreBloc storeBloc= HeartRateStoreBloc(bloc);
  HeartRateEventGenerator eventGenerator= HeartRateEventGenerator(bloc: bloc);
  eventGenerator.start();
  await Future.delayed(const Duration(seconds: 5));
  eventGenerator.stop();
}
