import 'package:activity_state_management/config.dart';
import 'package:activity_state_management/home/action_generator.dart';
import 'package:activity_state_management/redux/UI/multi_connector/pixel_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../core/actions.dart';
import '../../core/app_state.dart';

class MultiConnectorReduxHomePage extends StatelessWidget {
  final bool optimized;

  const MultiConnectorReduxHomePage({Key? key, required this.optimized})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: optimized
            ? const Text("Redux Multi Connector optimized")
            : const Text("Redux Multi Connector"),
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
