import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/visibility_filter.dart';

class VisibilityFilterComponent extends StatelessWidget {

  const VisibilityFilterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TodoController todoController= Get.find();
    print("building: VisibilityFilter");

    return Obx(
           () {
            return DropdownButton<VisibilityFilter>(
              value: todoController.filter.value,
              items: VisibilityFilter.values.map((filter) {
                return DropdownMenuItem<VisibilityFilter>(
                    child: Text(filter.toString()), value: filter);
              }).toList(),
              onChanged: (filter) {
                    todoController.filter.value=filter!;
              },
            );
          }
        );

  }
}
