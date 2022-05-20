import 'package:flutter/material.dart';

import '../../../config.dart';
import 'pixel.dart';

class PixelContainer extends StatelessWidget {
  const PixelContainer({Key? key}) : super(key: key);

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
    ));
  }

  List<Widget> generateRows() {
    return List.generate(
        pixelsSquared,
        (x) => Row(
            children: List.generate(
                pixelsSquared,
                (y) => Pixel(
                      x: x,
                      y: y,
                    )).toList())).toList();
  }
}
