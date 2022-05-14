import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class ActionGenerator extends StatefulWidget {
  final Function(int, int) action;

  const ActionGenerator({Key? key, required this.action}) : super(key: key);

  @override
  State<ActionGenerator> createState() => _ActionGeneratorState();
}

class _ActionGeneratorState extends State<ActionGenerator> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: on ? Colors.limeAccent : Colors.red,
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)
              ]),
        ),
        RepaintBoundary(
          child: TextButton(
              onPressed: on ? () {} : () => generateOne(context),
              child: const Text("generate one")),
        ),
        RepaintBoundary(
          child: TextButton(
              onPressed: on ? () {} : () => startGenerate(context),
              child: const Text("start generating")),
        ),
        RepaintBoundary(
          child: TextButton(
              onPressed: () => stopGenerate(), child: const Text("stop")),
        ),
      ],
    );
  }

  void stopGenerate() async {
    setState(() {
      on = false;
    });
  }

  void generateOne(BuildContext context) {
    int x, y;
    Random rand = Random();
    x = rand.nextInt(pixelsSquared);
    y = rand.nextInt(pixelsSquared);
    widget.action(x, y);
  }

  void startGenerate(BuildContext context) async {
    setState(() {
      on = true;
    });

    int count = 0;
    while (on == true && count < numPoints) {
      await Future.delayed(Duration(milliseconds: interval), () {
        generateOne(context);
      });
      count++;
    }
    setState(() {
      on = false;
    });
  }
}
