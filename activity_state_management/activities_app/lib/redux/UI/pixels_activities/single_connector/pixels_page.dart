import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../action_generator.dart';
import '../../../core/actions.dart';
import '../../../core/app_state.dart';
import 'pixel_container_with_connector.dart';

class PixelsPage extends StatelessWidget {
  const PixelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redux Single Connector"),
        leading: IconButton(
          onPressed: () {
            StoreProvider.of<AppState>(context).dispatch(Reset());
            Navigator.of(context).pop();},
          icon: const Icon(Icons.chevron_left),
        ),
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
