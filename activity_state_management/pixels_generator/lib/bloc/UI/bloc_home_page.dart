import 'package:activity_state_management/activity.dart';
import 'package:activity_state_management/bloc/UI/bloc_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlocHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const BlocHomePage({Key? key, required this.exitSolution}) : super(key: key);

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: widget.exitSolution,
              icon: const Icon(Icons.chevron_left),
            ),
            title: const Text("Bloc home")),
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
                      route: routeBlocPixelsPage, color: Colors.blueAccent),
                  Activity(
                      route: routeBlocPixelsOptimizedPage,
                      color: Colors.blueAccent)
                ],
              ),
            ),
          ),
        ));
  }
}
