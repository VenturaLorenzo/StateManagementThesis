import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_pattern/models/todo_store.dart';
import 'package:provider/provider.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building Stats");

    final store = Provider.of<TodoStore>(context);
    return Observer(
      builder: (context) {
               return Center(child: Text(store.stats));
      },
    );
  }
}
