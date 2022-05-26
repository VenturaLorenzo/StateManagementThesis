import 'package:equatable/equatable.dart';

import '../core/heart_rate.dart';


abstract class HeartRateStoreEvent extends Equatable {}

class HeartRateChanged extends HeartRateStoreEvent {
  final HeartRate heartRate;

  HeartRateChanged({required this.heartRate});

  @override
  List<Object?> get props => [heartRate];
}
