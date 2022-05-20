import 'package:activity_state_management/activity.dart';
import 'package:activity_state_management/setState/UI/setState_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetStateHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const SetStateHomePage({Key? key, required this.exitSolution})
      : super(key: key);

  @override
  State<SetStateHomePage> createState() => _SetStateHomePageState();
}

class _SetStateHomePageState extends State<SetStateHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: widget.exitSolution,
              icon: const Icon(Icons.chevron_left),
            ),
            title: const Text("SetState home")),
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
                      route: routeSetStatePixelsPage, color: Colors.blueAccent),
                ],
              ),
            ),
          ),
        ));
  }
}
