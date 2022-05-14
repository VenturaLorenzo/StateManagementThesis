import 'package:mobx/mobx.dart';

import '../../config.dart';

part 'store.g.dart';

class PixelStore = _PixelsStore with _$PixelStore;

abstract class _PixelsStore with Store {
  @observable
  ObservableList<ObservableList<ObservableBool>> pixels =
      ObservableList<ObservableList<ObservableBool>>.of(List.generate(
          pixelsSquared,
          (index) => ObservableList<ObservableBool>.of(
                  List.generate(pixelsSquared, (index) {
                return ObservableBool(false);
              }))));

  @action
  toggle(int x, int y) {
    pixels[x][y].value = true;
  }
}
