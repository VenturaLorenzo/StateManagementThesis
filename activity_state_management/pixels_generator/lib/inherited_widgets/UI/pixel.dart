import 'package:activity_state_management/inherited_widgets/core/pixels_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class Pixel extends StatelessWidget {
  final int x;
  final int y;

  const Pixel({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pixelHeight,
      width: pixelWidth,
      color:
          PixelsProvider.of(context).pixels[x][y] ? Colors.black : Colors.white,
    );
  }
}
