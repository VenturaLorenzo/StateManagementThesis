//create the Inherited class
import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class _InheritedPixels extends InheritedWidget {
  //value of the counter
  final List<List<bool>> pixels;

  //increment function passed from the stateful widget
  final void Function(int, int) toggle;
  final void Function() reset;


  const _InheritedPixels(
      {Key? key,required this.reset,
      required this.pixels,
      required Widget child,
      required this.toggle})
      : super(key: key, child: child);

  //decide whether to rebuild based on the previous state
  @override
  bool updateShouldNotify(_InheritedPixels oldWidget) {
    return true;
  }
}

//provider and handler class for the state
class PixelsProvider extends StatefulWidget {
  final Widget child;

  //position the of method in the public class
  static _InheritedPixels of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      _InheritedPixels? inherited=context.dependOnInheritedWidgetOfExactType<_InheritedPixels>();
      assert(inherited!=null, "no PixelProvider found");
      return inherited!;
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
  List<List<bool>> pixels = generatePixels();

  //increment function
  void toggle(int x, int y) {
    setState(() {
      pixels[x][y] = true;
    });
  }
  void reset() {
    setState(() {
      pixels= generatePixels();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPixels(reset: reset,
        pixels: pixels, toggle: toggle, child: widget.child);
  }
}
