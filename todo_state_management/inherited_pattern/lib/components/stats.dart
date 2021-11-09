import 'package:flutter/cupertino.dart';
import 'package:inherited_pattern/todo_provider.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building Stats");

    return Text(TodoInheritedData.of(context,aspect: 3)!.stats.toString());
  }
}
