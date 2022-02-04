import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/visibility_filter_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/visibility_filter.dart';
import 'package:redux_pattern/selectors/selectors.dart';

class VisibilityFilterSelector extends StatelessWidget {
  const VisibilityFilterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VisibilityFilter>(
      distinct: true,
      converter: (store) => filterSelector(store.state),
      builder: (context, activeFilter) {
        print("Building Visibility filter");

        return DropdownButton<VisibilityFilter>(
          value: activeFilter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(describeEnum(filter)), value: filter);
          }).toList(),
          onChanged: (filter) {
            StoreProvider.of<AppState>(context)
                .dispatch(SetVisibilityFilterAction(filter!));
          },
        );
      },
    );
  }
}
