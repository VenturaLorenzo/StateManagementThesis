import 'dart:math';
import 'package:activity_state_management/home/activity.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Color> colors = List.generate(
      6,
          (index) =>
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Activities"),
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
                  Activity(
                    route: "reduxMultiConnector",
                    color: colors[0],
                  ),
                  Activity(
                      route: "reduxMultiConnectorOptimized", color: colors[0]),
                  Activity(route: "reduxSingleConnector", color: colors[0]),
                  Activity(route: "mobx", color: colors[1]),
                  Activity(route: "inheritedWidgets", color: colors[2]),
                  Activity(route: "inheritedModels", color: colors[2]),
                  Activity(route: "setState", color: colors[2]),
                  Activity(route: "bloc", color: colors[3]),
                  Activity(route: "blocOptimized", color: colors[3]),
                ],
              ),
            ),
          ),
        ));
  }
}


