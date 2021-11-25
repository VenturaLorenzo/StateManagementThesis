import 'package:bloc_pattern/barrels/todo_filtered_state_management.dart';
import 'package:bloc_pattern/blocs/tab_bloc.dart';
import 'package:bloc_pattern/models/visibility_filter.dart';
import 'package:bloc_pattern/states/tab_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityFilterComponent extends StatelessWidget {

  const VisibilityFilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: VisibilityFilterComponent");

    return BlocBuilder<TabBloc,TabState>(
      builder: (context,tabState) {
        return tabState==TabState.todos ?BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
          builder: (context, filteredTodoState) {
            final VisibilityFilter filter= filteredTodoState is FilteredTodoLoadedState? filteredTodoState.filter: VisibilityFilter.all;
            return DropdownButton<VisibilityFilter>(
              value: filter,
              items: VisibilityFilter.values.map((filter) {
                return DropdownMenuItem<VisibilityFilter>(
                    child: Text(describeEnum(filter)), value: filter);
              }).toList(),
              onChanged: (filter) {
               BlocProvider.of<FilteredTodoBloc>(context).add(FilteredTodoChangeFilterEvent(filter!));
              },
            );
          },
        ):Container();
      }
    );
  }
}
