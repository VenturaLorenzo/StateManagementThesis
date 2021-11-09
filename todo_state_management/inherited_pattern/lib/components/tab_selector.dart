import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_pattern/models/tab_state.dart';


class TabSelector extends StatelessWidget {
  final TabState currTab;
  final Function(int) onTabChange;
  const TabSelector({Key? key,required this.currTab,required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Tab Selector");

    return  BottomNavigationBar(
          currentIndex: TabState.values.indexOf(currTab),
          onTap: onTabChange,
          items: TabState.values
              .map((tab) => BottomNavigationBarItem(title:  Text(tab.toString()),
                    icon: Icon(
                      tab == TabState.todos ? Icons.list : Icons.show_chart,
                    ),
                  ))
              .toList(),
        );

  }
}


