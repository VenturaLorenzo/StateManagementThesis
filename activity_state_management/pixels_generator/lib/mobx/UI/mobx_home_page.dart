import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/mobx/UI/pixel_container.dart';
import 'package:activity_state_management/mobx/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/action_generator.dart';

class MobXHomePage extends StatelessWidget {
  const MobXHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MobX"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("back"))
        ],
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
