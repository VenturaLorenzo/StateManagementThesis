import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';
import '../core/pixels_provider.dart';

class Pixel extends StatelessWidget {
  final int x;
  final int y;

  const Pixel({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        height: pixelHeight,
        width: pixelWidth,
        color:
            PixelsProvider.of(context, rebuild: true, aspect: {'x': x, 'y': y})
                    .pixels[x][y]
                ? Colors.black
                : Colors.white,
      );
    });
  }
}
