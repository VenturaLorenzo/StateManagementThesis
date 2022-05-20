import 'package:activity_state_management/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../action_generator.dart';
import '../../core/store.dart';
import 'pixel_container.dart';

class PixelsPage extends StatelessWidget {
  const PixelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MobX"),
        leading: IconButton(
          onPressed: () {
            Provider.of<PixelStore>(context,listen: false).reset();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PixelContainer(rowsNumber: pixelsSquared),
            PixelContainer(rowsNumber: pixelsSquared),
            ActionGenerator(
              action: (int x, int y) {
                return Provider.of<PixelStore>(context, listen: false)
                    .toggle(x, y);
              },
            ),
          ],
        ),
      ),
    );
  }
}
