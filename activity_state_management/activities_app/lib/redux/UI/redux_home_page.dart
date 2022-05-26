import 'package:activity_state_management/redux/UI/redux_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../activity.dart';

class ReduxHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const ReduxHomePage({Key? key, required this.exitSolution}) : super(key: key);

  @override
  State<ReduxHomePage> createState() => _ReduxHomePageState();
}

class _ReduxHomePageState extends State<ReduxHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: widget.exitSolution,
              icon: const Icon(Icons.chevron_left),
            ),
            title: const Text("Redux home")),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Activity(
                      route: routeReduxPixelsPageMultiConnector,
                      color: Colors.blueAccent),
                  Activity(
                      route: routeReduxPixelsPageMultiConnectorOptimized,
                      color: Colors.blueAccent),
                  Activity(
                      route: routeReduxPixelsPageSingleConnector,
                      color: Colors.blueAccent),
                ],
              ),
            ),
          ),
        ));
  }
}
