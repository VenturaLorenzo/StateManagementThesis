import 'package:redux_pattern/actions/tab_actions.dart';
import 'package:redux_pattern/models/tab_state.dart';
import 'package:redux/redux.dart';

final tabReducer= combineReducers<TabState>([
  TypedReducer<TabState, SetTabAction>(_setTabState),

]);
TabState _setTabState(TabState state, SetTabAction action){
   return action.newtab;
}