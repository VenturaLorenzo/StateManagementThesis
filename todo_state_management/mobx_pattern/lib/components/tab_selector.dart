import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_pattern/models/tab_state.dart';

class TabSelector extends StatelessWidget {
  final Observable<TabState> tab;

  const TabSelector({Key? key,required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building TabSelector");

    return Observer(
      builder: (context) {
        return BottomNavigationBar(
          currentIndex: TabState.values.indexOf(tab.value),
          onTap: (index){runInAction(()=>tab.value= TabState.values.elementAt(index));},
          items: TabState.values
              .map((tab) => BottomNavigationBarItem(title: const Text("data"),
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
