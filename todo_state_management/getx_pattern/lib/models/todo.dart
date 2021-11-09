import 'package:get/get.dart';

class Todo {
  RxString name = RxString("");
  RxString description = RxString("");
  RxBool completed = RxBool(false);

  Todo({required description, required name, required completed}) {
    this.name.value = name;
    this.description.value = description;
    this.completed.value = completed;
  }
}
