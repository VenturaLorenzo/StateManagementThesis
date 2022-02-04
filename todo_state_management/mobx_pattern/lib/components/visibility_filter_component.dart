import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:mobx_pattern/models/visibility_filter.dart';
import 'package:provider/provider.dart';

class VisibilityFilterSelector extends StatelessWidget {
  const VisibilityFilterSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);
    return Observer(
      builder: (context) {
        print("building Visibilityfilter");

        return DropdownButton<VisibilityFilter>(
          value: store.filter,
          items: VisibilityFilter.values.map((filter) {
            return DropdownMenuItem<VisibilityFilter>(
                child: Text(describeEnum(filter)), value: filter);
          }).toList(),
          onChanged: (tappedValue) {
            store.changeFilter(tappedValue!);
          },
        );
      },
    );
  }
}
