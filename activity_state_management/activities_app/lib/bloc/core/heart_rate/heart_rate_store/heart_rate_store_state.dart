import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';
import 'package:equatable/equatable.dart';

abstract class HeartRateStoreState extends Equatable{
}
class EmptyStore extends  HeartRateStoreState{

  @override
  List<Object?> get props => [];

}
class FullStore extends  HeartRateStoreState{
  final List<HeartRate> heartRateSeries;

  FullStore({required this.heartRateSeries});
  @override
  // TODO: implement props
  List<Object?> get props => [...heartRateSeries ];

}
class StoringHeartRates extends  HeartRateStoreState{
  final List<HeartRate> heartRateSeries;

  StoringHeartRates({required this.heartRateSeries});
  @override
  // TODO: implement props
  List<Object?> get props => [heartRateSeries ];

}