import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/home/action_generator.dart';
import 'package:activity_state_management/setState/UI/pixel_container_setState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetStateHomePage extends StatefulWidget {
  const SetStateHomePage({Key? key}) : super(key: key);

  @override
  _SetStateHomePage createState() => _SetStateHomePage();
}

class _SetStateHomePage extends State<SetStateHomePage> {
  List<List<bool>> pixels = List.generate(
      pixelsSquared, (index) => List.generate(pixelsSquared, (index) => false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("setState"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PixelContainerSetState(pixels: pixels),
            PixelContainerSetState(pixels: pixels),
            ActionGenerator(action: (int x, int y) {
              setState(() {
                pixels[x][y] = true;
              });
            })
          ],
        ),
      ),
    );
  }
}
