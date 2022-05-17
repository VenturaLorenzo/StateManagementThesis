
import 'package:activity_state_management/inherited_models/core/pixels_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/action_generator.dart';
import '../../inherited_models/UI/pixel_container.dart';

class InheritedModelsHomePage extends StatelessWidget {
  const InheritedModelsHomePage({Key? key}) : super(key: key);

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
              return PixelsProvider.of(context,rebuild: false,aspect: {}).toggle(x,y);
            })
          ],
        ),
      ),
    );
  }
}
