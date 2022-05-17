import 'package:activity_state_management/mobx/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class PixelWithObserver extends StatelessWidget {
  final int x;
  final int y;

  const PixelWithObserver({Key? key, required this.x, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pixelStore = Provider.of<PixelStore>(context);

    return Observer(builder: (context) {
      return Container(
        height: pixelHeight,
        width: pixelWidth,
        color: pixelStore.pixels[x][y].value ? Colors.black : Colors.white,
      );
    });
  }
}
