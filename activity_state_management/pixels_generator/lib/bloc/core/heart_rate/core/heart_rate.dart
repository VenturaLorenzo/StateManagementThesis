import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';

class HeartRate{

  final int value;
  final DateTime date;
  HeartRate({required this.value,required this.date});
  @override
  toString(){
    return "Data: $date \ value: $value";
  }
}