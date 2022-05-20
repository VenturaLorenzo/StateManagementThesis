import 'package:activity_state_management/config.dart';

import 'actions.dart';
import 'app_state.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is Toggle) {
    assert(action.x >= 0 && action.x < 128, "out of range");
    assert(action.y >= 0 && action.y < 128, "out of range");

    AppState newState = AppState.clone(state);
    newState.pixels[action.x][action.y] = true;
    return newState;
  } else if (action is Reset) {
    AppState newState = AppState.clone(state);
    newState.pixels = generatePixels();
    return newState;
  } else {
    return state;
  }
}
