import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  //create a store object with the AppState model
  Store<AppState> counterStore =
      Store<AppState>(appStateReducer, initialState: AppState(counter: 0));
  //locate the StoreProvider widget at the root to provide the state
  runApp(StoreProvider<AppState>(store: counterStore, child: const MyApp()));
}

void printState(Store counterStore) {
  print(counterStore.state.counter);
}

class AppState {
  //variable representing the counter value
  int counter = 0;
  //define the constructor with the possibility
  // of setting a value for the counter
  AppState({required this.counter});
}

class IncrementByOne {
  IncrementByOne();
}
//action to increment the counter value
class IncrementAction {
  //value to be added
  final int value;

  IncrementAction(this.value);
}
//action to decrement the counter value
class DecrementAction {
  //value to be subtracted
  final int value;

  DecrementAction(this.value);
}
//root reducer
AppState appStateReducer(AppState state, action) {
  //create a new int instance not mutating the state
  //this could be avoided because operations already return a new instance
  //but this highlights the Redux workflow
  int newValue;
  //check if action is of type increment
  if (action is IncrementAction) {
    //populate the new variable with the actual counter
    //value plus the value contained in the action
    newValue = state.counter + action.value;
    //return a new AppState
    return AppState(counter: newValue);
  }
  //check if action is of type decrement
  else if (action is DecrementAction) {
    //populate the new variable with the actual counter
    //value minus the value contained in the action
    newValue = state.counter - action.value;
    //return a new AppState
    return AppState(counter: newValue);
  } else {
    //in case the action is unknown return the current state
    return state;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //use a StoreBuilder
        body: StoreBuilder<AppState>(builder: (context, store) {
          //access the store in the builder to print the counter value
          return Text(store.state.counter.toString());
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          //dispatch an action incrementing the counter by one
          StoreProvider.of<AppState>(context).dispatch(IncrementAction(1));
        }),
      ),
    );
  }
}
