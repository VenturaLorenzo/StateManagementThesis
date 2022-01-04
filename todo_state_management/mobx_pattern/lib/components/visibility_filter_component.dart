import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo_list.dart';
import 'package:mobx_pattern/models/visibility_filter.dart';
import 'package:provider/provider.dart';

class VisibilityFilterComponent extends StatelessWidget {
  const VisibilityFilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);

    return Observer(
      builder: (context) {
        print("building Visibilityfilter");

        return DropdownButton<VisibilityFilter>(
          value: todoList.filter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(describeEnum(filter)), value: filter);
          }).toList(),
          onChanged: (filter) {
            todoList.filter = filter!;
          },
        );
      },
    );
  }
}
