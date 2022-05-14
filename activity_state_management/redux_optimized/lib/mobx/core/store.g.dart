// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PixelStore on _PixelsStore, Store {
  late final _$pixelsAtom = Atom(name: '_PixelsStore.pixels', context: context);

  @override
  ObservableList<ObservableList<Observable<bool>>> get pixels {
    _$pixelsAtom.reportRead();
    return super.pixels;
  }

  @override
  set pixels(ObservableList<ObservableList<Observable<bool>>> value) {
    _$pixelsAtom.reportWrite(value, super.pixels, () {
      super.pixels = value;
    });
  }

  late final _$_PixelsStoreActionController =
      ActionController(name: '_PixelsStore', context: context);

  @override
  dynamic toggle(int x, int y) {
    final _$actionInfo =
        _$_PixelsStoreActionController.startAction(name: '_PixelsStore.toggle');
    try {
      return super.toggle(x, y);
    } finally {
      _$_PixelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pixels: ${pixels}
    ''';
  }
}
