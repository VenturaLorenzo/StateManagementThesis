import 'package:activity_state_management/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final bool active;

  const Pixel({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pixelHeight,
      width: pixelWidth,
      color: active ? Colors.black : Colors.white,
    );
  }
}
