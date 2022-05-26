import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../action_generator.dart';
import '../../../core/actions.dart';
import '../../../core/app_state.dart';
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
            StoreProvider.of<AppState>(context).dispatch(Reset());
            Navigator.of(context).pop();},
          icon: const Icon(Icons.chevron_left),
        ),
        title: optimized
            ? const Text("Redux Multi Connector optimized")
            : const Text("Redux Multi Connector"),
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
                return StoreProvider.of<AppState>(context)
                    .dispatch(Toggle(x, y));
              },
            ),
          ],
        ),
      ),
    );
  }
}
