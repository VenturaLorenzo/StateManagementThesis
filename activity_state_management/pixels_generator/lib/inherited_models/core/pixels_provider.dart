//create the Inherited class
import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class _InheritedPixels extends InheritedModel<Map> {
  //value of the counter
  final List<List<bool>> pixels;

  //increment function passed from the stateful widget
  final void Function(int, int) toggle;

  const _InheritedPixels(
      {Key? key,
      required this.pixels,
      required Widget child,
      required this.toggle})
      : super(key: key, child: child);

  //decide whether to rebuild based on the previous state
  @override
  bool updateShouldNotify(_InheritedPixels oldWidget) {
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant _InheritedPixels oldWidget, Set<Map> dependencies) {
    bool test = oldWidget.pixels[dependencies.first['x']]
            [dependencies.first['y']] !=
        pixels[dependencies.first['x']][dependencies.first['y']];
    print(oldWidget.pixels[dependencies.first['x']][dependencies.first['y']]);
    print(pixels[dependencies.first['x']][dependencies.first['y']]);

    return false;
  }
}

//provider and handler class for the state
class PixelsProvider extends StatefulWidget {
  final Widget child;

  //position the of method in the public class
  static _InheritedPixels of(BuildContext context,
      {bool rebuild = true, required Map aspect}) {
    if (rebuild) {
      return (InheritedModel.inheritFrom<_InheritedPixels>(context,
          aspect: aspect) as _InheritedPixels);
    }
    return (context.findAncestorWidgetOfExactType<_InheritedPixels>()
        as _InheritedPixels);
  }

  const PixelsProvider({Key? key, required this.child}) : super(key: key);

  @override
  _PixelsProviderState createState() => _PixelsProviderState();
}

class _PixelsProviderState extends State<PixelsProvider> {
  //value of the counter
  List<List<bool>> pixels = List.generate(
      pixelsSquared, (index) => List.generate(pixelsSquared, (index) => false));

  //increment function
  void toggle(int x, int y) {
    setState(() {
      pixels[x][y] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPixels(
        pixels: pixels, toggle: toggle, child: widget.child);
  }
}
