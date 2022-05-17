import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/redux/UI/single_connector/pixel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../core/app_state.dart';

class PixelContainerWithConnector extends StatelessWidget {
  const PixelContainerWithConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: StoreConnector<AppState, List<List<bool>>>(
          converter: (store) => store.state.pixels,
          builder: (context, pixels) {
            return Container(
              height: pixels.length * pixelHeight + 20,
              width: pixels.length * pixelWidth + 20,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 10)),
              child: Column(
                children: generateRows(pixels),
              ),
            );
          }),
    );
  }

  List<Widget> generateRows(List<List<bool>> pixels) {
    return pixels
        .map((list) =>
            Row(children: list.map((active) => Pixel(active: active)).toList()))
        .toList();
  }
}
