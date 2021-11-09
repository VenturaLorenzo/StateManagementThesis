import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/visibility_filter_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/visibility_filter.dart';

class VisibilityFilterComponent extends StatelessWidget {

  const VisibilityFilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Visibility filter");

    return StoreConnector<AppState, VisibilityFilter>(
      converter: (store) => store.state.visibilityFilter,
      builder: (context, activeFilter) {
        return DropdownButton<VisibilityFilter>(
          value: activeFilter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(filter.toString()), value: filter);
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
