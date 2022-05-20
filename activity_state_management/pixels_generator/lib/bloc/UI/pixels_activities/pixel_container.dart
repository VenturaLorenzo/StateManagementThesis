import 'package:activity_state_management/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pixel_with_builder.dart';

class PixelContainer extends StatelessWidget {
  final bool optimized;

  const PixelContainer({Key? key, required this.optimized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        height: pixelsSquared * pixelHeight + 20,
        width: pixelsSquared * pixelWidth + 20,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 10)),
        child: Column(
          children: generateRows(),
        ),
      ),
    );
  }

  List<Widget> generateRows() {
    return List.generate(
        pixelsSquared,
        (x) => Row(
            children: List.generate(
                pixelsSquared,
                (y) => PixelWithBuilder(
                      optimized: optimized,
                      x: x,
                      y: y,
                    )).toList())).toList();
  }
}
