import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/setState/UI/pixel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PixelContainerSetState extends StatelessWidget {
  final List<List<bool>> pixels;

  const PixelContainerSetState({Key? key, required this.pixels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        height: pixels.length * pixelHeight + 20,
        width: pixels.length * pixelWidth + 20,
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
        pixels.length,
        (x) => Row(
            children: List.generate(
                pixels.length,
                (y) => Pixel(
                      active: pixels[x][y],
                    )).toList())).toList();
  }
}
