import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/visibility_filter.dart';
import 'package:inherited_pattern/todo_provider.dart';

class VisibilityFilterComponent extends StatelessWidget {

  const VisibilityFilterComponent(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Visibility filter");
    TodoInheritedData store= TodoInheritedData.of(context, aspect: 1);
    VisibilityFilter filter= store.filter;
    return DropdownButton<VisibilityFilter>(
      value: filter,
      items: VisibilityFilter.values.map((filter) {
        return DropdownMenuItem<VisibilityFilter>(
            child: Text(describeEnum(filter)), value: filter);
      }).toList(),
      onChanged: (filter) {
        store.onChangeFilter(filter!);
      },
    );
  }
}
