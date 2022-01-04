import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_pattern/components/stats.dart';
import 'package:redux_pattern/components/tab_selector.dart';
import 'package:redux_pattern/components/todo_view.dart';
import 'package:redux_pattern/components/visibility_filter_component.dart';
import 'package:redux_pattern/models/app_state.dart';
import 'package:redux_pattern/models/tab_state.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  const HomePage({Key? key, required this.onInit}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Building HomePage");

    return StoreConnector<AppState, TabState>(
      converter: (store) => store.state.tabState,
      builder: (context, currTab) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Todo App"),
              actions: const [VisibilityFilterSelector()],
            ),
            body: currTab == TabState.todos ? const TodoView() : const Stats(),
            bottomNavigationBar: const TabSelector(),
            floatingActionButton: currTab == TabState.todos
                ? FloatingActionButton(
                    child: const Icon(Icons.plus_one),
                    onPressed: () {
                      Navigator.pushNamed(context, "/addTodo");
                    })
                : Container());
      },
    );
  }
}
