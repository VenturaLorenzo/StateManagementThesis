import 'package:redux/redux.dart';

import 'package:redux_pattern/actions/visibility_filter_actions.dart';
import 'package:redux_pattern/models/visibility_filter.dart';

final visibilityFilterReducer = combineReducers<VisibilityFilter>([
  TypedReducer<VisibilityFilter, SetVisibilityFilterAction>(
      _setVisibilityFilter)
]);

VisibilityFilter _setVisibilityFilter(
    VisibilityFilter oldState, SetVisibilityFilterAction action) {
  return action.filter;
}
