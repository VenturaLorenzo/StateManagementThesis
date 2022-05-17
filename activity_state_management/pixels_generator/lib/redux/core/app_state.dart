import 'package:activity_state_management/config.dart';

class AppState {
  List<List<bool>> pixels = List.generate(
      pixelsSquared, (index) => List.generate(pixelsSquared, (index) => false));

  AppState();

  AppState.fromPixels(this.pixels);

  AppState.clone(AppState appState) : this.fromPixels(appState.pixels);
}
