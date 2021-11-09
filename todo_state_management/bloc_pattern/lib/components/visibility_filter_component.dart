import 'package:bloc_pattern/barrels/todo_filtered_state_management.dart';
import 'package:bloc_pattern/models/visibility_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityFilterComponent extends StatelessWidget {

  const VisibilityFilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: VisibilityFilterComponent");

    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
      builder: (context, filteredTodoState) {
        final VisibilityFilter filter= filteredTodoState is FilteredTodoLoadedState? filteredTodoState.filter: VisibilityFilter.all;
        return DropdownButton<VisibilityFilter>(
          value: filter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(filter.toString()), value: filter);
          }).toList(),
          onChanged: (filter) {
           BlocProvider.of<FilteredTodoBloc>(context).add(FilteredTodoChangeFilterEvent(filter!));
          },
        );
      },
    );
  }
}
