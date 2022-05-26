import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User page")),
      body: Container(
          child: Column(
        children: [TextButton(onPressed: () {}, child: Text("Change pass"))],
      )),
    );
  }
}
