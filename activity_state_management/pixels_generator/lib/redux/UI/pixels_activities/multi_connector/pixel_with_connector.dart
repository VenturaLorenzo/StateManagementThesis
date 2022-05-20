import 'package:activity_state_management/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../core/app_state.dart';

class PixelWithConnector extends StatelessWidget {
  final bool optimized;
  final int x;
  final int y;

  const PixelWithConnector(
      {Key? key, required this.optimized, required this.x, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        converter: (store) => store.state.pixels[x][y],
        distinct: optimized ? true : false,
        builder: (context, active) {
          return Container(
            height: pixelHeight,
            width: pixelWidth,
            color: active ? Colors.black : Colors.white,
          );
        });
  }
}
