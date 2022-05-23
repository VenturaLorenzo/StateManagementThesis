import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';
import 'package:equatable/equatable.dart';

abstract class HeartRateState extends Equatable{
}
class WaitingForFirstHeartRate extends  HeartRateState{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CurrentHeartRate extends  HeartRateState{
  final HeartRate receivedHeartRate;

  CurrentHeartRate({required this.receivedHeartRate});
  @override
  // TODO: implement props
  List<Object?> get props => [receivedHeartRate ];

}