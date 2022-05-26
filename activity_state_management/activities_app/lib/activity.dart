import 'package:activity_state_management/loading_page.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String route;
  final Color color;

  const Activity({Key? key, required this.route, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 10,
        child: Card(
          elevation: 2.0,
          color: color,
          child: Center(
              child: Text(
            route,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoadingPage(route: route)),
        );
        //callback();
      },
    );
  }
}
