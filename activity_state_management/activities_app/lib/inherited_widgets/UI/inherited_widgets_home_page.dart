import 'package:activity_state_management/activity.dart';
import 'package:flutter/material.dart';

import 'inherited_widgets_navigator.dart';

class InheritedWidgetsHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const InheritedWidgetsHomePage({Key? key, required this.exitSolution})
      : super(key: key);

  @override
  State<InheritedWidgetsHomePage> createState() =>
      _InheritedWidgetsHomePageState();
}

class _InheritedWidgetsHomePageState extends State<InheritedWidgetsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: widget.exitSolution,
              icon: const Icon(Icons.chevron_left),
            ),
            title: const Text("InheritedWidgets home")),
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
                      route: routeInheritedWidgetsPixelsPage,
                      color: Colors.blueAccent),
                ],
              ),
            ),
          ),
        ));
  }
}
