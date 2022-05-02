import 'package:flutter/material.dart';

void main() {
  runApp(const CounterProvider(child: MyApp()));
}

//create the Inherited class
class _InheritedCounter extends InheritedWidget {
  //value of the counter
  final int value;

  //increment function passed from the stateful widget
  final void Function(int) increment;

  const _InheritedCounter(
      {Key? key,
      required this.value,
      required Widget child,
      required this.increment})
      : super(key: key, child: child);

  //decide whether to rebuild based on the previous state
  @override
  bool updateShouldNotify(_InheritedCounter oldWidget) {
    return true;
  }
}

//provider and handler class for the state
class CounterProvider extends StatefulWidget {
  final Widget child;

  //position the of method in the public class
  static _InheritedCounter of(BuildContext context,{bool rebuild = true}) {
    if (rebuild) {
      return (context.dependOnInheritedWidgetOfExactType<_InheritedCounter>() as _InheritedCounter);
    }
    return (context.findAncestorWidgetOfExactType<_InheritedCounter>() as _InheritedCounter);
    // or
    // return (context.ancestorInheritedElementForWidgetOfExactType(_MyInheritedWidget).widget as _MyInheritedWidget).data;

  }

  const CounterProvider({Key? key, required this.child}) : super(key: key);

  @override
  _CounterProviderState createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
  //value of the counter
  int value = 0;

  //increment function
  void incrementCounter(int value) {
    setState(() {
      value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("building counterProvider");
    //return a screenshot of the state using an Inherited class
    return _InheritedCounter(
        value: value, increment: incrementCounter, child: widget.child);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("building MyApp");

    return MaterialApp(
      home: Scaffold(
        //access the counter value and disply it
        body: const Testo(),
        //access and use the increment function
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            CounterProvider.of(context,rebuild: false).increment(1);
          },
        ),
      ),
    );
  }
}
class Testo extends StatelessWidget {
  const Testo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building Testo");

    return Text(CounterProvider.of(context).value.toString());
  }
}

