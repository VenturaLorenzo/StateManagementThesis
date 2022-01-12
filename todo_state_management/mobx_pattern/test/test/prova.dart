
/*
part 'prova.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @readonly
  int _value = 0;

  @action
  void increment() {
    _value++;
  }
}*/
class Ciao{
  final int a=0;
}
//final Counter counter = Counter(); // Instantiate the store
void main() {
 Ciao uno= Ciao();
 Ciao due = Ciao();
 print(uno==due);
}