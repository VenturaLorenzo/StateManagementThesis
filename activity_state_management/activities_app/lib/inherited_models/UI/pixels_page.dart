import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../action_generator.dart';
import '../core/pixels_provider.dart';
import 'pixel_container.dart';

class PixelsHomePage extends StatelessWidget {
  const PixelsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidgets "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PixelContainer(),
            const PixelContainer(),
            ActionGenerator(action: (int x, int y) {
              return PixelsProvider.of(context, rebuild: false, aspect: {})
                  .toggle(x, y);
            })
          ],
        ),
      ),
    );
  }
}
