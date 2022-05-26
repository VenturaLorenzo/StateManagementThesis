import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config.dart';
import '../../core/pixels/pixels_bloc.dart';
import '../../core/pixels/pixels_state.dart';

class PixelWithBuilder extends StatelessWidget {
  final bool optimized;
  final int x;
  final int y;

  const PixelWithBuilder(
      {Key? key, required this.optimized, required this.x, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PixelsBloc, PixelsState>(buildWhen: (previous, current) {
      if (optimized) {
        return !(previous is PixelsCurrentState &&
            current is PixelsCurrentState &&
            previous.pixels[x][y] == current.pixels[x][y]);
      } else {
        return true;
      }
    }, builder: (context, state) {
      if (state is PixelsCurrentState && state.pixels.isNotEmpty) {
        return Container(
          height: pixelHeight,
          width: pixelWidth,
          color: state.pixels[x][y] ? Colors.black : Colors.white,
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
