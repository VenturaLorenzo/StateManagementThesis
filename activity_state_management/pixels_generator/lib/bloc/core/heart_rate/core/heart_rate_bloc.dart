import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_event.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_state.dart';
import 'package:bloc/bloc.dart';

class HeartRateBloc extends Bloc<HeartRateEvent, HeartRateState> {
  HeartRateBloc() : super(WaitingForFirstHeartRate());

  @override
  Stream<HeartRateState> mapEventToState(HeartRateEvent event) async* {
    if(event is ReceivedHeartRate){
      print(event.heartRate.toString());
      yield CurrentHeartRate(receivedHeartRate: event.heartRate);
    }
  }
}
