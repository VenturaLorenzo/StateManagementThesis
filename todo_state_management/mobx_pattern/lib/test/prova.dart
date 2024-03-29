import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/models/tab_state.dart';
import 'package:mobx_pattern/models/todo.dart';

part 'prova.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @readonly
  int _value = 0;

  @action
  void increment() {
    _value++;
  }
}


final counter = Counter(); // Instantiate the store
void main() {
  mainContext.config = mainContext.config
      .clone(isSpyEnabled: true, writePolicy: ReactiveWritePolicy.always);
  mainContext.spy((event) {
    print("event name : " + event.name);
    print("event type : " + event.type);
  });
  counter._value = 10;
  print(counter._value);
}
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counter.tab = TabState.todos;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/
