// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Counter on CounterBase, Store {
  Computed<int>? _$doubleComputed;

  @override
  int get double => (_$doubleComputed ??=
          Computed<int>(() => super.double, name: 'CounterBase.double'))
      .value;

  final _$_valueAtom = Atom(name: 'CounterBase._value');

  int get value {
    _$_valueAtom.reportRead();
    return super._value;
  }

  @override
  int get _value => value;

  @override
  set _value(int value) {
    _$_valueAtom.reportWrite(value, super._value, () {
      super._value = value;
    });
  }

  final _$CounterBaseActionController = ActionController(name: 'CounterBase');

  @override
  void increment(int value) {
    final _$actionInfo = _$CounterBaseActionController.startAction(
        name: 'CounterBase.increment');
    try {
      return super.increment(value);
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
double: ${double}
    ''';
  }
}
