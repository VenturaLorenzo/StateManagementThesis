import 'dart:async';

import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_state.dart';
import 'package:bloc/bloc.dart';

import 'heart_rate_store_event.dart';
import 'heart_rate_store_state.dart';

class HeartRateStoreBloc
    extends Bloc<HeartRateStoreEvent, HeartRateStoreState> {
  late StreamSubscription subscription;

  HeartRateStoreBloc(HeartRateBloc bloc) : super(EmptyStore()) {
    subscription = bloc.stream.listen((state) {
      if (state is CurrentHeartRate) {add(HeartRateChanged(heartRate: state.receivedHeartRate));}
    });
  }

  @override
  Stream<HeartRateStoreState> mapEventToState(
      HeartRateStoreEvent event) async* {
    if (event is HeartRateChanged) {
      if (state is StoringHeartRates || state is EmptyStore) {

        List<HeartRate> rates = state is StoringHeartRates? [...(state as StoringHeartRates).heartRateSeries]:[];
        rates.add(event.heartRate);
        yield StoringHeartRates(heartRateSeries: rates);
      }
    }
  }
}
