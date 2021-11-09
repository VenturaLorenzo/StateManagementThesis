import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTodoPage extends StatefulWidget {
  const UpdateTodoPage({Key? key}) : super(key: key);

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Todo"),
        ),
        body: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a new name'),
            ),
          TextButton(onPressed: (){}, child: const Text("Confirm"))],
        ));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
