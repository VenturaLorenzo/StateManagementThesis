import 'package:activity_state_management/bloc/UI/pixel_container.dart';
import 'package:activity_state_management/bloc/core/pixels_bloc.dart';
import 'package:activity_state_management/bloc/core/pixels_event.dart';
import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/home/action_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatelessWidget {
  final bool optimized;

  const BlocHomePage({Key? key, required this.optimized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
