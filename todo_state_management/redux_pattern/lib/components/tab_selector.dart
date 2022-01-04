import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_pattern/actions/tab_actions.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/tab_state.dart';
import 'package:redux/redux.dart';
class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, TabState>(
      distinct: true,
      converter:(store)=>store.state.tabState,
      builder: (context, currTab) {
        print("Building Tab Selector");

        return BottomNavigationBar(
          currentIndex: TabState.values.indexOf(currTab),
          onTap: (index)=>StoreProvider.of<AppState>(context).dispatch(SetTabAction(TabState.values.elementAt(index))),
          items: TabState.values
              .map((tab) => BottomNavigationBarItem(label: describeEnum(tab),
                    icon: Icon(
                      tab == TabState.todos ? Icons.list : Icons.show_chart,
                    ),
                  ))
              .toList(),
        );
      },
    );
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
