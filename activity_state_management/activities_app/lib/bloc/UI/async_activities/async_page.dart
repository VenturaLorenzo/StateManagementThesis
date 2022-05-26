import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_state.dart';
import 'package:activity_state_management/bloc/core/heart_rate/heart_rate_store/heart_rate_store_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/heart_rate/heart_rate_event_generator.dart';
import '../../core/heart_rate/heart_rate_store/heart_rate_store_state.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  late HeartRateEventGenerator eventGenerator;
  TooltipBehavior tool = TooltipBehavior(enable: true);

  @override
  initState() {
    super.initState();
    HeartRateBloc bloc = BlocProvider.of<HeartRateBloc>(context);
    eventGenerator = HeartRateEventGenerator(bloc: bloc);
    eventGenerator.start();
  }
int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async page"),
      ),
      body: Column(
        children: [
          BlocBuilder<HeartRateStoreBloc, HeartRateStoreState>(
              builder: (context, state) {
                if(state is EmptyStore){
                  return Text("aspettando");
                }else{
                  return Text((state as StoringHeartRates).heartRateSeries.length.toString());

                }
              }),
          Center(child: SafeArea(child:
              BlocBuilder<HeartRateStoreBloc, HeartRateStoreState>(
                  builder: (context, state) {
            if (state is StoringHeartRates) {
              return SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                title: ChartTitle(text: "prova"),
                legend: Legend(isVisible: true),
                tooltipBehavior: tool,
                series: <ChartSeries>[
                  SplineSeries<HeartRate, DateTime>(
                      name: "prova",
                      dataSource: state.heartRateSeries,
                      xValueMapper: (HeartRate heartRate, _) => heartRate.date,
                      yValueMapper: (HeartRate heartRate, _) => heartRate.value,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }))),
        ],
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    eventGenerator.stop();
  }
}
