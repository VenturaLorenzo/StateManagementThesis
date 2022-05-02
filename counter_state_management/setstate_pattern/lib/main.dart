import 'package:flutter/material.dart';

void main() {
  runApp(TopPage());
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Counter value: '),
        Text('$counter'),
        RaisedButton(
          onPressed: () {
            increment();
          },
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build HomePage");

    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Demo'),
      ),
      body: Column(
        children: <Widget>[
          Text('Counter value: '),
          Text('$counter'),
          RaisedButton(
            onPressed: () {
              increment();
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA(this.value, {Key? key}) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    print("build WidgetA");

    return Column(
      children: [
        Center(
          child: Text(
            '$value',
          ),
        ),
      ],
    );
  }
}

class WidgetD extends StatelessWidget {
  final int prova;

  const WidgetD(this.prova, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetD");

    return Text('I am a widget that will not be rebuilt. $prova');
  }
}

class WidgetF extends StatelessWidget {
  const WidgetF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetF");

    return const Text('I am a widget that will not be rebuilt.');
  }
}

class WidgetE extends StatelessWidget {
  const WidgetE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetE");

    return const Text('I am a widget that will not be rebuilt.');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetB");

    return const Text('I am a widget that will not be rebuilt.');
  }
}

class WidgetC extends StatelessWidget {
  final void Function() increment;

  const WidgetC(this.increment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build WidgetC");
    return RaisedButton(
      onPressed: () {
        increment();
      },
      child: const Icon(Icons.add),
    );
  }
}
