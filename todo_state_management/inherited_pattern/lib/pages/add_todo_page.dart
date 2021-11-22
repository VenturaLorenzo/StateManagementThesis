import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddTodoPage extends StatefulWidget {

  final void Function(String,String) addTodoCallback;

  const AddTodoPage({Key? key, required this.addTodoCallback}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final textControllerName = TextEditingController();
  final textControllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: Column(
          children: [
            TextField(
              controller: textControllerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a name'),
            ),
            TextField(
              controller: textControllerDesc,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a description'),
            ),
            TextButton(onPressed: () {

              widget.addTodoCallback(textControllerName.text,textControllerDesc.text);
              Navigator.pop(context);
            }, child: const Text("Create"))
          ],
        ));
  }

  @override
  void dispose() {
    textControllerName.dispose();
    textControllerDesc.dispose();
    super.dispose();
  }
}
