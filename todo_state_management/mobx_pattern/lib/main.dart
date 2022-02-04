import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'myapp.dart';

void main() {
  mainContext.config = mainContext.config
      .clone(isSpyEnabled: true, writePolicy: ReactiveWritePolicy.always);
  mainContext.spy((event) {
    if (event.type == "action") {
      print("event name : " + event.name);
    }
  });
  runApp(const MyApp());
}
