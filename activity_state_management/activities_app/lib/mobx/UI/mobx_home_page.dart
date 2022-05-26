import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../activity.dart';
import 'mobx_navigator.dart';

class MobxHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const MobxHomePage({Key? key, required this.exitSolution}) : super(key: key);

  @override
  State<MobxHomePage> createState() => _MobxHomePageState();
}

class _MobxHomePageState extends State<MobxHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: widget.exitSolution,
              icon: const Icon(Icons.chevron_left),
            ),
            title: const Text("Mobx home")),
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
                      route: routeMobxPixelsPage, color: Colors.blueAccent),
                ],
              ),
            ),
          ),
        ));
  }
}
