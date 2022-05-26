import 'package:activity_state_management/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../action_generator.dart';
import 'pixel_container_setState.dart';

class PixelsPage extends StatefulWidget {
  const PixelsPage({Key? key}) : super(key: key);

  @override
  _SetStateHomePage createState() => _SetStateHomePage();
}

class _SetStateHomePage extends State<PixelsPage> {
  List<List<bool>> pixels = List.generate(
      pixelsSquared, (index) => List.generate(pixelsSquared, (index) => false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left),
        ),
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
