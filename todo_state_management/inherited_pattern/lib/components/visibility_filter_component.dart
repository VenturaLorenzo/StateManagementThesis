import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';

class VisibilityFilterComponent extends StatelessWidget {
  final VisibilityFilter filter;
  final void Function(VisibilityFilter) onFilterChange;
  const VisibilityFilterComponent({Key? key,required this.filter,required this.onFilterChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Visibility filter");

    return DropdownButton<VisibilityFilter>(
          value: filter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(filter.toString()), value: filter);
          }).toList(),
          onChanged: (filter) {onFilterChange(filter!);},
        );

  }
}
