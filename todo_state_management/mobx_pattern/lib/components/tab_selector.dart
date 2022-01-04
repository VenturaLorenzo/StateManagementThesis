import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/models/tab_state.dart';

class TabSelector extends StatelessWidget {
  final Observable<TabState> tab;

  const TabSelector({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building TabSelector");
    return Observer(
      builder: (context) {
        return BottomNavigationBar(
          currentIndex: TabState.values.indexOf(tab.value),
          onTap: (index) {
            runInAction(() => tab.value = TabState.values.elementAt(index));
          },
          items: TabState.values
              .map((tab) => BottomNavigationBarItem(
                    label: describeEnum(tab),
                    icon: Icon(
                      tab == TabState.todos ? Icons.list : Icons.show_chart,
                    ),
                  ))
              .toList(),
        );
      }
    );
  }
}
