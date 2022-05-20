import 'package:activity_state_management/action_generator.dart';
import 'package:activity_state_management/bloc/core/pixels_bloc.dart';
import 'package:activity_state_management/bloc/core/pixels_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pixel_container.dart';

class PixelsPage extends StatelessWidget {
  final bool optimized;

  const PixelsPage({Key? key, required this.optimized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<PixelsBloc>(context).add(ResetPixels());
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: optimized
            ? const Text("Bloc optimized")
            : const Text("Bloc not optimized"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PixelContainer(
              optimized: optimized,
            ),
            PixelContainer(
              optimized: optimized,
            ),
            ActionGenerator(
              action: (int x, int y) {
                return BlocProvider.of<PixelsBloc>(context)
                    .add(TogglePixel(x, y));
              },
            ),
          ],
        ),
      ),
    );
  }
}
