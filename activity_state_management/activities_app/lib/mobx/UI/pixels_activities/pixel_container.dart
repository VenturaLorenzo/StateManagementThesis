import 'package:activity_state_management/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pixel_with_observer.dart';

class PixelContainer extends StatelessWidget {
  final int rowsNumber;

  const PixelContainer({Key? key, required this.rowsNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        height: rowsNumber * pixelHeight + 20,
        width: rowsNumber * pixelWidth + 20,
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
        rowsNumber,
        (x) => Row(
            children: List.generate(
                rowsNumber,
                (y) => PixelWithObserver(
                      x: x,
                      y: y,
                    )).toList())).toList();
  }
}
