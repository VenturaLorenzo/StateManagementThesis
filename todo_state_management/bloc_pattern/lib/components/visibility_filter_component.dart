
import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/events/filtered_todos_event.dart';
import 'package:bloc_pattern/models/visibility_filter.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:bloc_pattern/states/tab_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityFilterSelector extends StatelessWidget {
  const VisibilityFilterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: VisibilityFilterComponent");

    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        builder: (context, filteredTodoState) {
      final VisibilityFilter filter =
          filteredTodoState is FilteredTodoLoadedState
              ? filteredTodoState.filter
              : VisibilityFilter.all;
      return DropdownButton<VisibilityFilter>(
        value: filter,
        items: VisibilityFilter.values.map((filter) {
          return DropdownMenuItem<VisibilityFilter>(
              child: Text(describeEnum(filter)), value: filter);
        }).toList(),
        onChanged: (filter) {
          BlocProvider.of<FilteredTodoBloc>(context)
              .add(FilteredTodoChangeFilterEvent(filter!));
        },
      );
    });
  }
}
