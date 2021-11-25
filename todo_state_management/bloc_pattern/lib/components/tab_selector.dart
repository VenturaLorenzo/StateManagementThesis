import 'package:bloc_pattern/blocs/tab_bloc.dart';
import 'package:bloc_pattern/events/tab_event.dart';
import 'package:bloc_pattern/states/tab_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building: TabSelector");

    return BlocBuilder<TabBloc, TabState>(
      builder: (context, currTab) {
        return BottomNavigationBar(
          currentIndex: TabState.values.indexOf(currTab),
          onTap: (index)=>BlocProvider.of<TabBloc>(context).add(ChangeTabEvent(TabState.values.elementAt(index))),
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
