import 'package:bloc_pattern/states/tab_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TabEvent extends Equatable{

  const TabEvent();

}

class ChangeTabEvent extends TabEvent{
  final TabState tab;


  const ChangeTabEvent(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'TabUpdated { tab: $tab }';

}