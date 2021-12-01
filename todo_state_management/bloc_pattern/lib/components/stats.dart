import 'package:bloc_pattern/blocs/stats_bloc.dart';
import 'package:bloc_pattern/states/stats_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: Stats");

    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, statsState) {
        return statsState is StatsLoadedState
            ? Center(
                child: Text(statsState.completed.toString()),
              )
            : Center(child: const CircularProgressIndicator());
      },
    );
  }
}
