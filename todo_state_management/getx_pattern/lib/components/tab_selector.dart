import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_pattern/controllers/todo_controller.dart';
import 'package:getx_pattern/models/tab_state.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find();
    print("building: TabSelector");
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: TabState.values.indexOf(todoController.tab.value),
        onTap: (index) {
          todoController.tab.value = TabState.values.elementAt(index);
        },
        items: TabState.values
            .map((tab) => BottomNavigationBarItem(
                  title: Text(tab.toString()),
                  icon: Icon(
                    tab == TabState.todos ? Icons.list : Icons.show_chart,
                  ),
                ))
            .toList(),
      );
    });
  }
}

/*
class _ViewModel {

  TabState activeTab;
  Function(int) onTap;

  _ViewModel(this.activeTab,this.onTap);

  static _ViewModel toViewModel(Store<AppState> store){

    return _ViewModel(store.state.tabState,(index)=>store.dispatch(SetTabAction(TabState.values.elementAt(index))));
  }



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;
}*/
