
import 'package:activity_state_management/home/action_generator.dart';
import 'package:activity_state_management/inherited_widgets/UI/pixel_container.dart';
import 'package:activity_state_management/inherited_widgets/core/pixels_provider.dart';
import 'package:activity_state_management/redux/UI/single_connector/pixel_container_with_connector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class InheritedWidgetsHomePage extends StatelessWidget {
  const InheritedWidgetsHomePage({Key? key}) : super(key: key);

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
              return PixelsProvider.of(context,rebuild: false).toggle(x,y);
            })
          ],
        ),
      ),
    );
  }
}
