import 'package:flutter/material.dart';

import '../../../action_generator.dart';
import '../../core/pixels_provider.dart';
import 'pixel_container.dart';

class PixelsPage extends StatelessWidget {
  const PixelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        onPressed: () {
            PixelsProvider.of(context,rebuild: false).reset();
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.chevron_left),
      ),
        title: const Text("InheritedWidgets "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PixelContainer(),
            const PixelContainer(),
            ActionGenerator(action: (int x, int y) {
              return PixelsProvider.of(context, rebuild: false).toggle(x, y);
            })
          ],
        ),
      ),
    );
  }
}
