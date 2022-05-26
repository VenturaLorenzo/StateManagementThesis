import 'package:equatable/equatable.dart';

import 'heart_rate.dart';

abstract class HeartRateEvent extends Equatable {}

class ReceivedHeartRate extends HeartRateEvent {
  final HeartRate heartRate;

  ReceivedHeartRate({required this.heartRate});

  @override
  List<Object?> get props => [heartRate];
}
