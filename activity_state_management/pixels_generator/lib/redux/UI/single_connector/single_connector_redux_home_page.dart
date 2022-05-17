import 'package:activity_state_management/home/action_generator.dart';
import 'package:activity_state_management/redux/UI/single_connector/pixel_container_with_connector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../core/actions.dart';
import '../../core/app_state.dart';

class SingleConnectorReduxHomePage extends StatelessWidget {
  const SingleConnectorReduxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redux Single Connector"),
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
            const PixelContainerWithConnector(),
            const PixelContainerWithConnector(),
            ActionGenerator(action: (int x, int y) {
              return StoreProvider.of<AppState>(context).dispatch(Toggle(x, y));
            })
          ],
        ),
      ),
    );
  }
}
