import 'dart:convert';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/heart_rate_generator.dart';
import 'package:http/http.dart';

void main() async {
  HeartRateGenerator generator=HeartRateGenerator(HeartRateBloc());
  await generator.generateValues();
}
