import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(TopPage());
}
class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(

        child: const Prova(),
      ),
    );
  }
}
class Prova extends StatefulWidget {
  const Prova({Key? key}) : super(key: key);

  @override
  _ProvaState createState() => _ProvaState();
}

class _ProvaState extends State<Prova> {
  int prova=4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:   <Widget>[



          WidgetB(),
          WidgetA(),
          WidgetC(),

        ],
      ),

    );
  }
}

class _MyInheritedWidget extends InheritedWidget {
  const _MyInheritedWidget({
    required Widget child,
    required this.data,
  }) : super( child: child);

  final HomePageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return oldWidget.data!= data;
  }
}

class HomePage extends StatefulWidget {
  HomePage({

    required this.child,
  }) : super();

  final Widget child;

  @override
  HomePageState createState() => HomePageState();

  static HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>() as _MyInheritedWidget).data;
    }
    return (context.findAncestorWidgetOfExactType<_MyInheritedWidget>() as _MyInheritedWidget).data;
    // or
    // return (context.ancestorInheritedElementForWidgetOfExactType(_MyInheritedWidget).widget as _MyInheritedWidget).data;
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build HomePage");

    return _MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetA");

    final HomePageState state = HomePage.of(context);

    return Column(
      children: [
        Center(
          child: Text(
            '${state.counter}',
          ),
        ),

      ],
    );
  }
}
class BlueSquare extends StatelessWidget {
  final double size;

  const BlueSquare({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: Colors.blue,
    );
  }
}
class WidgetD extends StatelessWidget {
  final int prova;
  const WidgetD({required this.prova,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetD");

    return  Text('I am a widget that will not be rebuilt. $prova');
  }
}
class WidgetF extends StatelessWidget {
  const WidgetF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetF");

    return const Text('Counter value:');
  }
}
class WidgetE extends StatelessWidget {
  const WidgetE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetE");

    return const Text('Counter value:');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetB");

    return const Text('Counter value:');
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetC");
    final HomePageState state = HomePage.of(context, rebuild: false);
    return RaisedButton(
      onPressed: () {
        state._incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}