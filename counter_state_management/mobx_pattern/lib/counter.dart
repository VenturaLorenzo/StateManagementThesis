import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

//abstract counter class used by the code generator
abstract class CounterBase with Store {
  //readonly annotation is used to avoid automatically creating
  //setter and getter actions
  @readonly
  int _value = 0;

  @computed
  int get double {
    return _value * 2;
  }

    //define an action to change _value
  @action
  void increment(int value) {
    _value = _value + value;
  }
}
