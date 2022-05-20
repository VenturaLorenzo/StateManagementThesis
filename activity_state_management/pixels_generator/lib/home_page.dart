import 'dart:math';

import 'package:activity_state_management/bloc/UI/bloc_navigator.dart';
import 'package:activity_state_management/inherited_widgets/UI/inherited_widgets_navigator.dart';
import 'package:activity_state_management/mobx/UI/mobx_navigator.dart';
import 'package:activity_state_management/redux/UI/redux_navigator.dart';
import 'package:activity_state_management/setState/UI/setState_navigator.dart';
import 'package:activity_state_management/state_management_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<Color> colors = List.generate(
      6,
      (index) =>
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StateManagementItem(route: routeBlocHome, color: colors[0]),
                  StateManagementItem(
                      route: routeSetStateHome, color: colors[1]),
                  StateManagementItem(route: routeReduxHome, color: colors[2]),
                  StateManagementItem(route: routeMobxHome, color: colors[3]),
                  StateManagementItem(route: routeInheritedWidgetsHome, color: colors[4]),

                ],
              ),
            ),
          ),
        ));
  }
}
